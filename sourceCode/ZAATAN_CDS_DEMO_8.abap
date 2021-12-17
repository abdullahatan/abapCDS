*&---------------------------------------------------------------------*
*& Report zaatan_cds_exposed
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaatan_cds_exposed.

SELECT carrid,
       connid,
       fldate,
       price,
       \_flights-airpfrom,
       \_flights-airpto
       FROM zaatan_cds_07
       WHERE \_flights[ (*) ]-carrid = 'AA'
         AND \_flights[ (*) ]-connid = '17'
       INTO TABLE @DATA(t_outdat).

cl_demo_output=>display( t_outdat ).