
def main [] {
    let commands = [
        {|| notify-send "Test Summary" "Test Body"},
        {|| notify-send -u low "Low Urgency" "This is a low urgency notification"},
        {|| notify-send -u normal "Normal Urgency" "This is a normal urgency notification"},
        {|| notify-send -t 5000 -u critical "Critical Urgency" "This is a critical urgency notification"},
        {|| notify-send -t 5000 "Expiring Notification" "This notification will expire in 5 seconds"},
        {|| notify-send -a "TestApp" "App Name Test" "This notification has a custom app name"},
        {|| notify-send -i "dialog-information" "Icon Test" "This notification has an icon"},
        {|| notify-send -c "device" "Category Test" "This notification has a category"},
        {|| notify-send -e "Transient Test" "This is a transient notification"},
        {|| notify-send -h "int:value:50" "Hint Test" "This notification has a hint: 50%"},
        {|| notify-send -p "Print ID Test" "This notification will print its ID"},
        {|| 
            let first_id = (notify-send -p "First Notification" "This is the first notification" | str trim)
            notify-send -r $first_id "Replaced Notification" "This replaces the first notification"
        },
        {|| notify-send -w "Wait Test" "This notification will wait for user action"},
        {|| notify-send -A "0=OK" -A "1=Cancel" "Action Test" "This notification has actions"}
    ]

    let descriptions = [
        "basic notification",
        "low urgency notification",
        "normal urgency notification",
        "critical urgency notification",
        "expiring notification",
        "notification with a custom app name",
        "notification with an icon",
        "notification with a category",
        "transient notification",
        "notification with a hint",
        "notification that prints its ID",
        "notification that replaces another notification",
        "notification that waits for user action",
        "notification with actions"
    ]

    for $index in 0..($commands | length | $in - 1) {
        print $"Press Enter to send a ($descriptions | get $index)..."
        input | ignore
        do ($commands | get $index)
    }
}
