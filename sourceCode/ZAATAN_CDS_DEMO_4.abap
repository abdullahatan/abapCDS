@AbapCatalog.sqlViewName: 'ZAATAN_SQL04'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 04'
define view ZAATAN_CDS_04
    with parameters im_curr : abap.char( 3 )
as select from sflight {
    
    key carrid,
    key connid,
    key fldate,
        seatsmax_b, 
        seatsocc_b,
        seatsmax_f,
        seatsocc_f,
        price,
        currency
} 
    where currency = $parameters.im_curr
    


*&---------------------------------------------------------------------*
*& Report zaatan_cds_params
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaatan_cds_params.


DATA: _waers TYPE waers VALUE 'USD'.

SELECT * FROM zaatan_cds_04( im_curr = @_waers ) INTO TABLE @DATA(t_outdat).

cl_demo_output=>display( t_outdat ).