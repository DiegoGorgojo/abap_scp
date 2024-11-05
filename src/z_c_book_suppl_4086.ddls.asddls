@EndUserText.label: 'Booking Supplements - Consumption'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true@Search.searchable: true
define view entity z_c_book_suppl_4086 as projection on z_r_book_suppl_4086
{
    key BookSupplUUID,
    TravelUUID,
    BookingUUID,
    @Search.defaultSearchElement: true
    @ObjectModel.text.element: [ 'SupplementDescription' ]
    @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Supplement_StdVH',
                                                  element: 'SupplementID' },
                                                  additionalBinding: [{ localElement: 'BookSupplPrice',
                                                                         element: 'Price',
                                                                         usage: #RESULT } ,
                                                                         {localElement: 'CurrencyCode',
                                                                         element: 'CurrencyCode',
                                                                         usage: #RESULT }  ],
                                                                         useForValidation: true }]
    BookingSupplementID,
    
    _SupplementText.Description as SupplementDescription: localized,
    SupplementID,
    BookSupplPrice,
    @Consumption.valueHelpDefinition: [{ entity: {name: 'I_CurrencyStdVH',
                                                   element: 'Currency' },
                                                   useForValidation: true }]
    
    
    CurrencyCode,
    LocalLastChangedAt,
    /* Associations */
    _Booking: redirected to parent z_c_booking_4086,
    _Product,
    _SupplementText,
    _Travel : redirected to z_c_travel_4086
}
