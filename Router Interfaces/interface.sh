#!/bin/bash
action="$1"
interface="$2"

if [[ ! "$action" ]]; then
        echo "Argument 1 should be the action 'enable' or 'disable'" 1>&2
        exit 1
    fi

if [[ ! "$interface" ]]; then
        echo "Argument 2 should be the interface ie eth0" 1>&2
        exit 1
    fi

if [ $action = "enable" ]; then action="delete"; else action="set"; fi
echo $action

run="/opt/vyatta/bin/vyatta-op-cmd-wrapper"
cfg="/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper"
$cfg begin
$cfg $action interfaces ethernet $interface disable
$cfg commit
$cfg end
