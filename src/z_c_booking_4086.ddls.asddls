@EndUserText.label: 'Booking - Consumption'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity z_c_booking_4086
  as projection on z_r_booking_4086
{
  key BookingUUID,
      TravelUUID,
      @Search.defaultSearchElement: true
      BookingID,
      BookingDate,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer_StdVH',
                                                     element: 'CustomerID'},
                                           useForValidation: true }]

      CustomerID,
      _Customer.LastName        as CustomerName,

      @ObjectModel.text.element: [ 'CarrierName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight_StdVH',
                                                     element: 'AirlineID'},
                                           additionalBinding: [{ localElement: 'FlightDate',
                                                                 element: 'FlightDate',
                                                                 usage: #RESULT },
                                                               { localElement: 'ConnectionID',
                                                                 element: 'ConnectionID',
                                                                 usage: #RESULT },
                                                               { localElement: 'FlightPrice',
                                                                 element: 'Price',
                                                                 usage: #RESULT },
                                                               { localElement: 'CurrencyCode',
                                                                 element: 'CurrencyCode',
                                                                 usage: #RESULT }],
                                           useForValidation: true }]
      AirlineID,
      _Carrier.Name             as CarrierName,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight_StdVH',
                                                     element: 'ConnectionID'},
                                           additionalBinding: [{ localElement: 'FlightDate',
                                                                 element: 'FlightDate',
                                                                 usage: #RESULT },
                                                               { localElement: 'AirlineID',
                                                                 element: 'AirlineID',
                                                                 usage: #FILTER_AND_RESULT },
                                                               { localElement: 'FlightPrice',
                                                                 element: 'Price',
                                                                 usage: #RESULT },
                                                               { localElement: 'CurrencyCode',
                                                                 element: 'CurrencyCode',
                                                                 usage: #RESULT }],
                                           useForValidation: true }]
      ConnectionID,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight_StdVH',
                                           element: 'FlightDate'},
                                     additionalBinding: [{ localElement: 'AirlineID',
                                                           element: 'AirlineID',
                                                           usage: #FILTER_AND_RESULT },
                                                         { localElement: 'ConnectionID',
                                                           element: 'ConnectionID',
                                                           usage: #FILTER_AND_RESULT },
                                                         { localElement: 'FlightPrice',
                                                           element: 'Price',
                                                           usage: #RESULT },
                                                         { localElement: 'CurrencyCode',
                                                           element: 'CurrencyCode',
                                                           usage: #RESULT }],
                                     useForValidation: true }]
      FlightDate,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight_StdVH',
                                           element: 'Price'},
                               additionalBinding: [{ localElement: 'AirlineID',
                                                     element: 'AirlineID',
                                                     usage: #FILTER_AND_RESULT },
                                                   { localElement: 'ConnectionID',
                                                     element: 'ConnectionID',
                                                     usage: #FILTER_AND_RESULT },
                                                   { localElement: 'FlightDate',
                                                     element: 'FlightDate',
                                                     usage: #FILTER_AND_RESULT },
                                                   { localElement: 'CurrencyCode',
                                                     element: 'CurrencyCode',
                                                     usage: #RESULT }],
                               useForValidation: true }]
      FlightPrice,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH',
                                                     element: 'Currency' },
                                           useForValidation: true }]
      CurrencyCode,

      @ObjectModel.text.element: [ 'BookingStatusText' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Booking_Status_VH',
                                                     element: 'BookingStatus'} }]
      BookingStatus,
      _BookingStatus._Text.Text as BookingStatusText : localized,
      LocalLastChangedAt,
      /* Associations */
      _BookingStatus,
      _BookingSupplement : redirected to composition child z_c_book_suppl_4086,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent z_c_travel_4086
}
