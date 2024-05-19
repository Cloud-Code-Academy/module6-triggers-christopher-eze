    //Change the account type to 'Prospect'
  Trigger AccountTrigger on Account (before insert, after insert) {
    if (Trigger.isBefore && Trigger.isInsert) {
    for (Account acc : Trigger.new) {
      if (acc.Type == null) {
        acc.Type = 'Prospect';
          }
      }
    }  

    //Copy the shipping address to the billing address.
    if (Trigger.isBefore && Trigger.isInsert) {
      for (Account acc : Trigger.new) {
                acc.BillingStreet = acc.ShippingStreet;
                acc.BillingCity = acc.ShippingCity;
                acc.BillingState = acc.ShippingState;
                acc.BillingPostalCode = acc.ShippingPostalCode;
                acc.BillingCountry = acc.ShippingCountry;
      }
    }
git 
    if (Trigger.isBefore && Trigger.isInsert) {
    for (Account acc : Trigger.new) {
      if (acc.Phone != '' && acc.Website != '' && acc.Fax != '') {
          acc.Rating = 'Hot';
        }       
      }
    }
    

    if (Trigger.isAfter  && Trigger.isInsert) {
    List<Contact> conList = new List<Contact>();
    for (Account acc : Trigger.new) {
        Contact con = new Contact();
        con.LastName = 'DefaultContact';
        con.Email = 'default@email.com';
        con.AccountId = acc.Id;
        conList.add(con);
    }
      insert conList;
  }
}