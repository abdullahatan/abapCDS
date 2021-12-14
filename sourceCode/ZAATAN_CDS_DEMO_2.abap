@AbapCatalog.sqlViewName: 'ZAATAN_SQL02'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 02'
define view ZAATAN_CDS_02 as select from sflight 
{
    key carrid,
        connid,
        seatsmax_b, 
        seatsocc_b,
        ( seatsmax_b - seatsocc_b ) as seat_result,
        case 
            when seatsmax_b > seatsocc_b then 'Business Class boş koltuk mevcut' 
            else
                case 
                when seatsmax_f > seatsocc_f then 'First Class boş koltuk mevcut'
                else 'Boş koltuk mevcut değil'
                end 
            end as seat_name                       
}