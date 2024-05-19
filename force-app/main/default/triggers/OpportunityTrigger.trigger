trigger OpportunityTrigger on Opportunity (before insert, after insert, before update, after update, before delete, after delete) {
  if (Trigger.isUpdate) {
    for (Opportunity opp : Trigger.new) {
      if (opp.Amount >= 5000) {
      } else if (opp.Amount < 5000) {
          opp.addError ('Opportunity amount must be greater than 5000');
        }
      }     
    }
  
  if (Trigger.isDelete) {
    Map<Id, Opportunity> oppIdsMap = new Map<Id, Opportunity>([SELECT Id, 
                                                                      Name, 
                                                                      StageName, 
                                                                      Account.Industry FROM Opportunity 
                                                                                                  WHERE StageName = 'Closed Won' 
                                                                                                  AND Account.Industry = 'Banking' 
                                                                                                  AND Id IN: Trigger.Old]);
      for (Opportunity opps : Trigger.old) {
      if (oppIdsMap.containsKey(opps.Id)) {
        opps.addError('Cannot delete closed opportunity for a banking account that is won');
      }
    }
  }

      /*
    * Question 7
    * Opportunity Trigger
    * When an opportunity is updated set the primary contact on the opportunity to the contact on the same account with the title of 'CEO'.
    * Trigger should only fire on update.
    */

    if (Trigger.isBefore && Trigger.isUpdate) {
      for (Opportunity opps : Trigger.old) {
        
      }




    }

  }

