@AbapCatalog.sqlViewAppendName: 'ZAATAN_SQL_EXT01'
@EndUserText.label: 'Demo 03'
extend view ZAATAN_CDS_01 with ZAATAN_CDS_03 {
    sflight.planetype,
    sflight.price,
    sflight.currency
}
