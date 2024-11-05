CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Booking RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Booking RESULT result.

    METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Booking~calculateTotalPrice.

    METHODS setBookingDate FOR DETERMINE ON SAVE
      IMPORTING keys FOR Booking~setBookingDate.

    METHODS setBookingNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR Booking~setBookingNumber.

    METHODS validateConnection FOR VALIDATE ON SAVE
      IMPORTING keys FOR Booking~validateConnection.

    METHODS validateCurrrencyCode FOR VALIDATE ON SAVE
      IMPORTING keys FOR Booking~validateCurrrencyCode.

    METHODS validateCustomer FOR VALIDATE ON SAVE
      IMPORTING keys FOR Booking~validateCustomer.

    METHODS validateFlightPrice FOR VALIDATE ON SAVE
      IMPORTING keys FOR Booking~validateFlightPrice.

    METHODS validateStatus FOR VALIDATE ON SAVE
      IMPORTING keys FOR Booking~validateStatus.

ENDCLASS.

CLASS lhc_Booking IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD calculateTotalPrice.
  ENDMETHOD.

  METHOD setBookingDate.
  ENDMETHOD.

  METHOD setBookingNumber.

  data max_bookingid TYPE /dmo/booking_id.
  data booking_update TYPE TABLE FOR UPDATE z_r_travel_4086\\Booking.
  READ ENTITIES OF z_r_travel_4086 IN LOCAL MODE
  ENTITY Booking by \_Travel
  FIELDS (  TravelUUID )
  WITH CORRESPONDING #( keys )
  RESULT DATA(travels).

  Loop at travels INTO DATA(travel).

  READ ENTITIES OF z_r_travel_4086 IN LOCAL MODE
  ENTITY Travel BY \_Booking
  FIELDS (  BookingID )
  WITH VALUE #( ( %tky = travel-%tky ) )
  RESULT DATA(bookings).

  max_bookingid = '0000'.

  LOOP AT bookings INTO DATA(booking).

  if booking-BookingID > max_bookingid.
  max_bookingid = booking-BookingID.
  ENDIF.
ENDLOOP.






LOOP AT bookings INTO booking where BookingID is INITIAL.

max_bookingid += 1.


      append value #( %tky      = booking-%tky
                    BookingID = max_bookingid )  to booking_update.
      endloop.

 ENDLOOP.

 modify entities of z_r_travel_4086 in local mode
           entity Booking
           update fields ( BookingID )
           with booking_update.



  ENDMETHOD.

  METHOD validateConnection.
  ENDMETHOD.

  METHOD validateCurrrencyCode.
  ENDMETHOD.

  METHOD validateCustomer.
  ENDMETHOD.

  METHOD validateFlightPrice.
  ENDMETHOD.

  METHOD validateStatus.
  ENDMETHOD.

ENDCLASS.
