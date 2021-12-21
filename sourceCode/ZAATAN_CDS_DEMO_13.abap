*--------------------------------------------------------------------------*
* Union->   
*--------------------------------------------------------------------------*
@AbapCatalog.sqlViewName: 'ZAATAN_SQL10'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 10'
define view ZAATAN_CDS_10 as 
    select from ztab1
    {
        key key_a as id,
            description as value 
    }
    
    union
     
    select from ztab2
    {
        key key_b as id,
            infomation as value 
    }
    
*--------------------------------------------------------------------------*
* Union All->   
*--------------------------------------------------------------------------*
@AbapCatalog.sqlViewName: 'ZAATAN_SQL10'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 10'
define view ZAATAN_CDS_10 as 
    select from ztab1
    {
        key key_a as id,
            description as value 
    }
    
    union all
     
    select from ztab2
    {
        key key_b as id,
            infomation as value 
    }
    