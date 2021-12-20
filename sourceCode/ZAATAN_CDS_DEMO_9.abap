@AbapCatalog.sqlViewName: 'ZAATAN_SQL08'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 08'
define view ZAATAN_CDS_08 as select from spfli 
association [0..1] to sflight as _sflight
    on $projection.carrid = _sflight.carrid and
       $projection.connid = _sflight.connid 
{
 key carrid,
 key connid,
     distance,
     distid,
         
     _sflight.fldate
            
} 
