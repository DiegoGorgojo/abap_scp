@EndUserText.label: 'Booking - Interface'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity z_i_booking_4086
  as projection on z_r_booking_4086
{
  key BookingUUID,
      TravelUUID,
      BookingID,
      BookingDate,
      CustomerID,
      AirlineID,
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      /* Associations */
      _BookingStatus,
      _BookingSupplement : redirected to composition child z_i_booking_suppl_4086,
      _Carrier,
      _Connection,
      _Customer,
      _Travel            : redirected to parent z_i_travel_4086
}
