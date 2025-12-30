trigger AccountTrigger on Account (before insert) {
    for (Account acc : Trigger.new) {
        // Developer B wants a different description
        acc.Description = 'Description set by Developer B';
        acc.Rating = 'Hot';
    }
}
