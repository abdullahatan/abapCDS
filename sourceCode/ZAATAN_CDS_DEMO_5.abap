@AbapCatalog.sqlViewName: 'ZAATAN_SQL05'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 05'
define view ZAATAN_CDS_05 as select from sflight as sf
inner join spfli as sp
    on sf.carrid = sp.carrid and
       sf.connid = sp.connid
    {
        sf.carrid,
        sf.connid,
        sf.fldate,
        sf.price,
        sf.seatsmax_b,
        sf.seatsocc_b,
        sf.seatsmax_f,
        sf.seatsocc_f,
        sp.airpfrom,
        sp.airpto
    }

    