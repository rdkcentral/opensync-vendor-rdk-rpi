########################################################################
# If not stated otherwise in this file or this component's LICENSE
# file the following copyright and licenses apply:
#
# Copyright [2020] [RDK Management]
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
########################################################################
if [ "$CONFIG_RDK_EXTENDER" == "y" ]; then
    # do nothing if not set
    echo '["Open_vSwitch"]'
    exit
fi

cat << EOF
[
    "Open_vSwitch",
    {
        "op":"insert",
        "table":"Wifi_Inet_Config",
        "row": {
            "if_name": "brlan0",
            "ip_assign_scheme": "static",
            "if_type": "bridge",
            "inet_addr": "10.0.0.1",
            "netmask": "255.255.255.0",
            "dhcpd":  ["map",[
                              ["dhcp_option","26, 1600"],
                              ["force","false"],
                              ["lease_time", "12h"],
                              ["start", "10.0.0.2"],
                              ["stop", "10.0.0.253"]
                      ]],
            "network": true,
            "enabled": true
       }
    },
    {
        "op":"insert",
        "table":"Wifi_Inet_Config",
        "row": {
            "if_name": "erouter0",
            "if_type": "vif",
            "enabled": false
       }
    },
    {
        "op":"insert",
        "table":"Wifi_Inet_Config",
        "row": {
            "if_name": "wifi2",
            "ip_assign_scheme": "static",
            "if_type": "vif",
            "mtu": 1600,
            "inet_addr": "169.254.0.1",
            "netmask":"255.255.255.128",
            "dhcpd":  ["map",[
                              ["dhcp_option","26, 1600"],
                              ["force","false"],
                              ["lease_time", "12h"],
                              ["start", "169.254.0.10"],
                              ["stop", "169.254.0.126"]
                      ]],
            "network": true,
            "enabled": true
       }
    },
    {
        "op":"insert",
        "table":"Wifi_Inet_Config",
        "row": {
            "if_name": "wifi3",
            "ip_assign_scheme": "static",
            "if_type": "vif",
            "mtu": 1600,
            "inet_addr": "169.254.1.1",
            "netmask":"255.255.255.128",
            "dhcpd":  ["map",[
                              ["dhcp_option","26, 1600"],
                              ["force","false"],
                              ["lease_time", "12h"],
                              ["start", "169.254.1.10"],
                              ["stop", "169.254.1.126"]
                      ]],
            "network": true,
            "enabled": true
       }
    }

]
EOF
