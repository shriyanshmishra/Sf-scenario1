trigger AccountTrigger on Account (before insert) {
    for (Account acc : Trigger.new) {
        acc.Description = 'Verified by DevOps Pipeline';
    }
}