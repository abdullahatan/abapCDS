@AbapCatalog.sqlViewName: 'ZAATAN_SQL01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 01'
define view ZAATAN_CDS_01 as select from sflight 
{
    key carrid,
    key connid,
    key fldate,
        seatsmax_b, 
        seatsocc_b,
        seatsmax_f,
        seatsocc_f
}
