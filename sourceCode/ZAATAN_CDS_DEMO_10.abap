*&---------------------------------------------------------------------*
*& Report zaatan_cds_cardinality_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaatan_cds_cardinality_01.

SELECT carrid, connid, SUM( distance ) AS distance
  FROM zaatan_cds_08
    INTO TABLE @DATA(t_result)
      WHERE carrid = 'AA' AND connid = '17'
        GROUP BY carrid, connid.

cl_demo_output=>display( t_result ).