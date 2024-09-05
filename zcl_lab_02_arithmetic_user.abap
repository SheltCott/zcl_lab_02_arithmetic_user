CLASS zcl_lab_02_arithmetic_user DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.

    METHODS add_rates RETURNING VALUE(rv_result) TYPE string.
    METHODS subtract_rates RETURNING VALUE(rv_result) TYPE string.
    METHODS multiply_rates RETURNING VALUE(rv_result) TYPE string.
    METHODS divide_rates RETURNING VALUE(rv_result) TYPE string.
    METHODS integer_division RETURNING VALUE(rv_result) TYPE string.
    METHODS modulus_operation RETURNING VALUE(rv_result) TYPE string.
    METHODS exponentiation
      EXPORTING
                ev_expo          TYPE i
      RETURNING VALUE(rv_result) TYPE string.
    METHODS square_root
      IMPORTING iv_expo          TYPE i
      RETURNING VALUE(rv_result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_02_arithmetic_user IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*     Variable declaration
    DATA: lv_result TYPE string.

*    Call methods to perform operations

*   Addition / ADD statement
    out->write( me->add_rates( ) ).

*    Subtraction / SUBTRACT statement
    out->write( me->subtract_rates( ) ).

*    Multiplication / MULTIPLY statement
    out->write( me->multiply_rates( ) ).

*    Division / DIVIDE statement
    out->write( me->divide_rates( ) ).

*    Integer division / DIV statement
    out->write( me->integer_division( ) ).

*    Modulus operation / MOD statement
    out->write( me->modulus_operation( ) ).

*    Exponentiation
    exponentiation(
      IMPORTING
        ev_expo = DATA(lv_expo)
      RECEIVING
        rv_result = lv_result
    ).

    out->write( lv_result ).

*    Square root
    out->write( square_root( iv_expo = lv_expo ) ).
  ENDMETHOD.

 METHOD add_rates.
*     Variable declaration
    DATA: lv_base_rate            TYPE i VALUE 20,
          lv_corp_area_rate       TYPE i VALUE 10,
          lv_medical_service_rate TYPE i VALUE 15,
          lv_total_rate           TYPE i.

*     Addition operation
    lv_total_rate = lv_base_rate + lv_corp_area_rate + lv_medical_service_rate.
    ADD 5 TO lv_total_rate.

*     Export results
    rv_result = lv_total_rate.
  ENDMETHOD.

  METHOD subtract_rates.
*     Variable declaration
    DATA: lv_maintenance_rate TYPE i VALUE 30,
          lv_margin_rate      TYPE i VALUE 10,
          lv_base_rate        TYPE i.

*     Subtraction operation
    lv_base_rate = lv_maintenance_rate - lv_margin_rate.
    SUBTRACT 4 FROM lv_base_rate.

*     Export results
    rv_result = lv_base_rate.
  ENDMETHOD.

  METHOD multiply_rates.
*     Variable declaration
    DATA: lv_package_weight TYPE i VALUE 2,
          lv_cost_per_kg    TYPE i VALUE 3,
          lv_multi_rate     TYPE i.

*     Multiplication operation
    lv_multi_rate = lv_package_weight * lv_cost_per_kg.
    MULTIPLY lv_multi_rate BY 2.

*     Export results
    rv_result = lv_multi_rate.
  ENDMETHOD.

  METHOD divide_rates.
*     Variable declaration
    DATA: lv_total_weight TYPE i VALUE 38,
          lv_num_packages TYPE i VALUE 4,
          lv_applied_rate TYPE p LENGTH 10 DECIMALS 2.

*     Division operation
    lv_applied_rate = lv_total_weight / lv_num_packages.
    DIVIDE lv_applied_rate BY 3.

*     Export results
    rv_result = lv_applied_rate.
  ENDMETHOD.

  METHOD integer_division.
*     Variable declaration
    DATA: lv_total_cost         TYPE i VALUE 17,
          lv_discount_threshold TYPE i VALUE 4,
          lv_result             TYPE p LENGTH 4 DECIMALS 2.

*     Integer division operation
    lv_result = lv_total_cost DIV lv_discount_threshold.

*     Export results
    rv_result = lv_result.
  ENDMETHOD.

  METHOD modulus_operation.
*     Variable declaration
    DATA: lv_total_cost         TYPE i VALUE 19,
          lv_discount_threshold TYPE i VALUE 4,
          lv_remainder          TYPE p LENGTH 4 DECIMALS 2.

*     Modulus operation
    lv_remainder = lv_total_cost MOD lv_discount_threshold.

*     Export results
    rv_result = lv_remainder.
  ENDMETHOD.

  METHOD exponentiation.
*     Variable declaration
    DATA: lv_weight TYPE i VALUE 5.

*     Exponentiation operation
    ev_expo = lv_weight ** 2.

*     Export results
    rv_result = ev_expo.
  ENDMETHOD.

  METHOD square_root.
*     Variable declaration
    DATA: lv_square_root TYPE i.

*     Square root operation
    lv_square_root = sqrt( iv_expo ). " Value from the previous activity

*     Export results
    rv_result = lv_square_root.
  ENDMETHOD.
ENDCLASS.