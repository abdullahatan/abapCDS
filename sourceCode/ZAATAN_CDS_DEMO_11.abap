@AbapCatalog.sqlViewName: 'ZAATAN_SQL09'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 09'
define view ZAATAN_CDS_09 as select from spfli 
association [0..*] to sflight as _sflight
    on $projection.carrid = _sflight.carrid and
       $projection.connid = _sflight.connid 
{
 key carrid,
 key connid,
     distance,
     distid,
         
     _sflight.fldate
            
}
