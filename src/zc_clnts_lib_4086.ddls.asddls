@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_CLNTS_LIB_4086 as select from ztb_clnts_lib_86
{  
    key id_libro as IdLibro,
    count( distinct id_cliente ) as Ventas
}
group by id_libro;
