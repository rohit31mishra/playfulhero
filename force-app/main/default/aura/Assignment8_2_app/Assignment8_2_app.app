<aura:application extends="force:slds" controller="CaseCreationCls">
    <!--c:Assignment8_2_cmp/-->
    <!--c:NavigateCmp/-->
    <aura:handler name="init" value="{!this}" action="{!c.init}"/>
    <aura:attribute name="lstSelectedRecords" type="List"/>
    <aura:attribute name="selectedStr" type="String"/>
    <aura:attribute name="lstDeSelectedRecords1" type="Object"/>
    <aura:attribute name="lstDeSelectedRecords" type="List" default="[]"/>
    <aura:attribute name="emailToProcess" type="List" default="[]"/>
    <!--<aura:iteration items="{!v.lstSelectedRecords}" var="sr">
        <lightning:pill class="slds-m-around_xx-small" label="{!sr.Id}" name="{!sr.Id}" onremove="{! c.clear }"></lightning:pill>
    </aura:iteration>
    <aura:iteration items="{!v.lstDeSelectedRecords}" var="sr">
        <lightning:pill class="slds-m-around_xx-small" label="{!sr}" name="{!sr}" ></lightning:pill>
    </aura:iteration>-->
    <aura:iteration items="{!v.lstSelectedRecords}" var="sr">
        <div style=" border: 1px solid black; width: 250px; border-radius: 5px;" class="validEmail"> 
            <div>
               {!sr.Id}
            </div>
            <div>
                <ui:inputCheckbox aura:id="incomeLineId" value="true" text="{!sr.Id}" class="slds-checkbox pointer " change="{!c.processEmail}"/>
                <!--<div ><a href="" data-record="{!sr.Id}" aura:id="addBtn" class="addCls" onclick="{!c.addToValidList}">Add</a></div>
                <div><a href="" data-record="{!sr.Id}" aura:id="removeBtn" class="removeCls" onclick="{!c.addToValidList}">Remove</a></div>-->
            </div>
        </div>
    </aura:iteration>
</aura:application>