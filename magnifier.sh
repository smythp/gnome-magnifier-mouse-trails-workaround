#!/bin/bash



MAGNIFIER_SCHEMA="org.gnome.desktop.a11y.magnifier"

# gsettings monitor MAGNIFIER_SCHEMA

CURRENT_MAG_FACTOR=$(gsettings get $MAGNIFIER_SCHEMA mag-factor)

MAG_FACTOR_NO_DECIMAL=${CURRENT_MAG_FACTOR%.*}

# Calculate new magnification factor based on argument passed to script, "in" or "out"
if [ $1 == "in" ]; then
    NEW_MAG_FACTOR=$(($MAG_FACTOR_NO_DECIMAL + 1))
elif [ $1 == "out" ]; then
    NEW_MAG_FACTOR=$(($MAG_FACTOR_NO_DECIMAL - 1))
fi


MAG_ENABLED=$(gsettings get org.gnome.desktop.a11y.applications screen-magnifier-enabled)


# If requested magfactor >= 1, turn off Zoom
# If mag factor > 1 and Zoom is off, turn on Zoom and set the new mag factor
if [ $NEW_MAG_FACTOR -lt 2 ]; then
    echo "Current mag factor is $MAG_FACTOR_NO_DECIMAL"
    echo "Requested factor is $NEW_MAG_FACTOR which is less than 2"
    gsettings set $MAGNIFIER_SCHEMA mag-factor "1.0";
    gsettings set org.gnome.desktop.a11y.applications screen-magnifier-enabled false;
else
    echo "Requested mag factor is $NEW_MAG_FACTOR, which is 2 or greater";
    gsettings set $MAGNIFIER_SCHEMA mag-factor $NEW_MAG_FACTOR.0;
    gsettings set org.gnome.desktop.a11y.applications screen-magnifier-enabled true;

fi

    





# gsettings set $MAGNIFIER_SCHEMA mag-factor 4.0
