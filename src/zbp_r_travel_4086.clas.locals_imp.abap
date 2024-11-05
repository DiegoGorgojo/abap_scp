CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

  CONSTANTS:
            BEGIN OF travel_status,
            open TYPE c LENGTH 1 VALUE '0',
            accepted TYPE c LENGTH 1 VALUE 'A',
            rejected TYPE c LENGTH 1 VALUE 'X',
            END OF TRAVEL_STATUS.


    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Travel RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Travel RESULT result.

    METHODS precheck_create FOR PRECHECK
      IMPORTING entities FOR CREATE Travel.

    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE Travel.

    METHODS acceptTravel FOR MODIFY
      IMPORTING keys FOR ACTION Travel~acceptTravel RESULT result.

    METHODS deductDiscount FOR MODIFY
      IMPORTING keys FOR ACTION Travel~deductDiscount RESULT result.

    METHODS reCalcTotalPrice FOR MODIFY
      IMPORTING keys FOR ACTION Travel~reCalcTotalPrice.

    METHODS rejectTravel FOR MODIFY
      IMPORTING keys FOR ACTION Travel~rejectTravel RESULT result.

    METHODS Resume FOR MODIFY
      IMPORTING keys FOR ACTION Travel~Resume.

    METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Travel~calculateTotalPrice.

    METHODS setStatusOpen FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Travel~setStatusOpen.

    METHODS setTravelNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR Travel~setTravelNumber.

    METHODS validateAgency FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateAgency.

    METHODS validateCurrrencyCode FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateCurrrencyCode.

    METHODS validateCustomer FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateCustomer.

    METHODS validateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateDates.

ENDCLASS.

CLASS lhc_Travel IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD precheck_create.
  ENDMETHOD.

  METHOD precheck_update.
  ENDMETHOD.

  METHOD acceptTravel.

  MODIFY ENTITIES OF z_r_travel_4086 IN LOCAL MODE
  ENTITY Travel
  UPDATE FIELDS ( OverallStatus )
  WITH VALUE #( FOR key in keys ( %tky = key-%tky
                                 OverallStatus = travel_status-accepted ) ).

  READ ENTITIES OF z_r_travel_4086 IN LOCAL MODE
  ENTITY Travel
  ALL FIELDS
  WITH CORRESPONDING #( keys )
  RESULT DATA(travels).

  result = VALUE #( FOR travel in travels ( %tky = travel-%tky
                                            %param = travel ) ).



  ENDMETHOD.

  METHOD deductDiscount.
  ENDMETHOD.

  METHOD reCalcTotalPrice.
  ENDMETHOD.

  METHOD rejectTravel.

    MODIFY ENTITIES OF z_r_travel_4086 IN LOCAL MODE
  ENTITY Travel
  UPDATE FIELDS ( OverallStatus )
  WITH VALUE #( FOR key in keys ( %tky = key-%tky
                                 OverallStatus = travel_status-rejected ) ).

  READ ENTITIES OF z_r_travel_4086 IN LOCAL MODE
  ENTITY Travel
  ALL FIELDS
  WITH CORRESPONDING #( keys )
  RESULT DATA(travels).

  result = VALUE #( FOR travel in travels ( %tky = travel-%tky
                                            %param = travel ) ).


  ENDMETHOD.

  METHOD Resume.
  ENDMETHOD.

  METHOD calculateTotalPrice.
  ENDMETHOD.

  METHOD setStatusOpen.


  read entities of z_r_travel_4086 in local mode
           entity Travel
           fields ( OverallStatus )
           with corresponding #( keys )
           result data(travels).

    delete travels where OverallStatus is not initial.

    check travels is not initial.



  MODIFY ENTITIES OF z_r_travel_4086 IN LOCAL MODE
  ENTITY Travel
  UPDATE FIELDS ( OverallStatus )
  with VALUE #( for travel in travels ( %tky     = travel-%tky
                                                  OverallStatus = travel_status-open ) ).





  ENDMETHOD.

  METHOD setTravelNumber.

  read entities of z_r_travel_4086 in local mode
           entity Travel
           fields ( TravelID )
           with corresponding #( keys )
           result data(travels).

    delete travels where TravelID is not initial.

    check travels is not initial.

  SELECT SINGLE FROM ztb_travel_4086
  FIELDS MAX( travel_id )
  INTO @data(lv_max_travelid).

  MODIFY ENTITIES OF z_r_travel_4086 IN LOCAL MODE
  ENTITY Travel
  UPDATE FIELDS ( TravelID )
  with VALUE #( for travel in travels index into i ( %tky     = travel-%tky
                                                  TravelID = lv_max_travelid + i ) ).



  ENDMETHOD.

  METHOD validateAgency.
  ENDMETHOD.

  METHOD validateCurrrencyCode.
  ENDMETHOD.

  METHOD validateCustomer.
  ENDMETHOD.

  METHOD validateDates.
  ENDMETHOD.

ENDCLASS.
