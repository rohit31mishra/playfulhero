<aura:application extends="force:slds">
  <aura:attribute name="selectedLookUpRecord" type="sObject" default="{}"/>
    <c:CustomLookup objectAPIName="account" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecord}" label="Account Name"/>
    <c:SendEmailComponent />
    <c:EmailHeader objectAPIName="account" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecord}" label="Account Name"/> 
    <!--c:Lookup/ -->
   
</aura:application>