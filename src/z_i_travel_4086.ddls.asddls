@EndUserText.label: 'Travel - Interface'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity z_i_travel_4086
  provider contract transactional_interface
  as projection on z_r_travel_4086

{
  key TravelUUID,
      TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
  
      /* Associations */
      _Agency,
      _Booking : redirected to composition child z_i_booking_4086,
      _Currency,
      _Customer,
      _OverallStatus
}
