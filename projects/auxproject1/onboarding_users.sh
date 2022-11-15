#! /bin/bash

log () {
    #Output
    echo " "
    echo $1
}

report_status () {
    if [ $1 -eq 0 ]; then log "$2"
    else log "$3"; exit $1 
    fi
}


delete_user () {
    log "Deleting user [$1]..."

    #Delete user
    sudo userdel -r $1

    report_status $? "User [$1] deleted successfully" "Failed to delete user"
}  

create () {
    log "Creating user [$1]..."

    #Create user
    sudo useradd -m $1

    log "Adding user [$1] to developers group"

    #Append user to group (developers)
    sudo usermod -a $1 -G developers

    report_status $? "User [$1] created successfully" "Failed to create user"
}

create_user () {
    log "Starting to create user [$1]..."

    local DIR="/home/$1"
    
    if [ -e $DIR ]; then log "User already exist ($DIR)"; delete_user $1;
    else create $1
    fi
}   

create_ssh_config () {
    sudo mkdir $1 \
    && sudo touch $1/"authorized_keys" \
    && sudo chown saif:saif $1/"authorized_keys" \
    && sudo cat .ssh/id_rsa.pub > $1/"authorized_keys" \
    && sudo chown $2:$2 $1/"authorized_keys"

    report_status $? "Configured ssh successfully" "Failed to configure ssh"  
}

configure_ssh () {
    log "Starting ssh configuration for user [$1]..."

    local DIR="/home/$1/.ssh"

    if [ -e $DIR ]; then log "SSH config already exist"
    else create_ssh_config $DIR $1
    fi
}

process_user () {
    #Create User
    create_user $1;

    #Configure SSH
    configure_ssh $1
    
    log "================= Finshed execution ================="
}

start_script () {
    while read -r USER; 
    do
        $1 $USER
    done < "./names.csv"
}

run () {
    read -p "Clean Up ? (Enter Y/N) " DO_CLEAN
    case "$DO_CLEAN" in
        [yY])
            start_script delete_user
            ;;    
        [nN])
            start_script process_user
            ;;
        *)
            log "Please enter Y/N"
            ;;
    esac
}

run