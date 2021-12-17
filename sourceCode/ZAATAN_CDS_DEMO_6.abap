@AbapCatalog.sqlViewName: 'ZAATAN_SQL06'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 06'
define view ZAATAN_CDS_06 as select from sflight as sf
association [1] to spfli as _flights
    on sf.carrid = _flights.carrid and 
       sf.connid = _flights.connid
     {
        key sf.carrid,
        key sf.connid,
        sf.fldate,
        sf.price,
        sf.seatsmax_b,
        sf.seatsocc_b,
        sf.seatsmax_f,
        sf.seatsocc_f,
        _flights.airpfrom,
        _flights.airpto
    } 