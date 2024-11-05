@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_CLIENTES_4086 as select from ztb_clientes_86 as Clientes
inner join ztb_clnts_lib_86 as ClientesLibros on ClientesLibros.id_cliente = Clientes.id_cliente
{
    key ClientesLibros.id_libro as IdLibro,
    key Clientes.id_cliente as IdCliente,
    key Clientes.tipo_acceso as TipoAcceso,
    Clientes.nombre as Nombre,
    Clientes.apellidos as Apellidos,
    Clientes.email as Email,
    Clientes.url as Url
}
