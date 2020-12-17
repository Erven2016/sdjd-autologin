#!/bin/sh

script_screen="
===========================================\n
= SDJD-AUTOLOGIN : SETUP.SH\n
= Author: Erven2016\n
= Config will be saved to ./config.sh after finished all steps.\n
= Only for some universities in Shandong (Supported list and school id in README).\n
==========================================="

main()
{
    echo "Continuing to setup will earse previous config.sh..."
    
    echo "Input school id:";
    read school_id;

    echo "Input basip:";
    read base_ip;

    echo "Input username (phone number):";
    read username;

    echo "Input password:";
    read password;

    echo "Input JSESSIONID:";
    read JSESSIONID;

    echo "Do you want to log? (Logging save to ./logs)[y/n]"
    read is_log;

    show_inputs()
    {
        echo '======== config.sh =========';
        echo 'School ID:' $school_id;
        echo 'Base IP: ' $base_ip;
        echo 'Username: ' $username;
        echo 'Password: ' $password;
        echo 'JESSIONID: ' $JSESSIONID; 
        echo 'Is logging: ' $is_log;
        echo '============================';
    }

    save()
    {
        pattern="shool_id=$school_id;\nbase_ip=$base_ip;\nusername=$username;\npassword=$password;\nJSESSIONID=$JSESSIONID;\nis_log=$is_log;"
        show_inputs;
        echo "Saving to config.sh ..."
        echo $pattern > $(dirname $0)/config.sh;
        echo "Saved Successfully!"
        echo "Run login.sh for testing your new config."
    }

    save;

}

echo $script_screen;
main;