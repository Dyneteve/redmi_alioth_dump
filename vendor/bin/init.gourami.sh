#! /vendor/bin/sh
#
# Copyright (C) 2021 Raphielscape LLC. and Haruka LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

utils=$(getprop persist.vendor.sensors.gourami)

# Clean the file and regenerate
if [ ! "$utils" ]; then
    # Clear sensors list
    sed -i '/^/d' /mnt/vendor/persist/sensors/sensors_list.txt
    sed -i '/^/d' /mnt/vendor/persist/sensors/cit_sensors_list.txt
    # Remove existing CS35L41 calibration
    rm /mnt/vendor/persist/audio/cs35l41*
    # Copy MIUS calibration
    cp /vendor/etc/mius/mi* /mnt/vendor/persist/audio
    chmod 644 /mnt/vendor/persist/audio/mi*
fi

setprop persist.vendor.sensors.gourami true
