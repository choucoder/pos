<?php

require_once "../../../controladores/ventas.controlador.php";
require_once "../../../modelos/ventas.modelo.php";

require_once "../../../controladores/clientes.controlador.php";
require_once "../../../modelos/clientes.modelo.php";

require_once "../../../controladores/usuarios.controlador.php";
require_once "../../../modelos/usuarios.modelo.php";

require_once "../../../controladores/productos.controlador.php";
require_once "../../../modelos/productos.modelo.php";

//DATOS EMPRESA

require_once "../../../controladores/empresa.controlador.php";
require_once "../../../modelos/empresa.modelo.php";

class imprimirFactura{

public $codigo;

public function traerImpresionFactura(){

	//TRAEMOS LA INFORMACIÓN DE LA VENTA

	$itemVenta = "UUID";
	$valorVenta = $this->codigo;

	$respuestaVenta = ControladorVentas::ctrMostrarVentas($itemVenta, $valorVenta);

	$codigo=$respuestaVenta["codigo"];
	$fecha = substr($respuestaVenta["fecha"],0,-8);
	$productos = json_decode($respuestaVenta["productos"], true);
	$neto = number_format($respuestaVenta["neto"],2);
	$impuesto = number_format($respuestaVenta["impuesto"],2);
	$total = number_format($respuestaVenta["total"],2);
	$ves = number_format(floatval(ControladorVentas::getDolarPrice()), 2);
	$total_ves = number_format($total * $ves, 2);

	
	$metodoPago = $respuestaVenta["metodo_pago"];
	//TRAEMOS LA INFORMACIÓN DEL CLIENTE

	$itemCliente = "id";
	$valorCliente = $respuestaVenta["id_cliente"];

	$respuestaCliente = ControladorClientes::ctrMostrarClientes($itemCliente, $valorCliente);

	//TRAEMOS LA INFORMACIÓN DEL VENDEDOR

	$itemVendedor = "id";
	$valorVendedor = $respuestaVenta["id_vendedor"];

	$respuestaVendedor = ControladorUsuarios::ctrMostrarUsuarios($itemVendedor, $valorVendedor);

	//TRAEMOS LA INFORMACION DE LA EMPRESA

	$DatosEmpresa= ControladorEmpresa::ctrMostrarEmpresas(null, null);

	$nombreEmpresa=$DatosEmpresa[0]["NombreEmpresa"];
	$direccionEmpresa=$DatosEmpresa[0]["DireccionEmpresa"];
	$RFCEmpresa=$DatosEmpresa[0]["RFC"];
	$TelefonoEmpresa=$DatosEmpresa[0]["Telefono"];
	$CorreoElectronicoEmpresa=$DatosEmpresa[0]["CorreoElectronico"];

	//REQUERIMOS LA CLASE TCPDF

	require_once('tcpdf_include.php');

	$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
	$pdf->SetAutoPageBreak(TRUE, 0);
	$pdf->startPageGroup();


	$pdf->AddPage();

	// ---------------------------------------------------------

	$bloque1 = <<<EOF
		<table cellspacing="0" style="width: 100%; ">
			<tr>
				<td style="width:25%"><img src="images/SUPROEDI_binary.png"></td>
				<td style="width: 50%; color: #34495e;font-size:18px;text-align:center">
				<div style="font-size: 18px; text-align:center;">
					<span style="color:black;font-size:20px;font-weight:bold">
						$nombreEmpresa
					</span>
					<br>
					<span style="color:black;font-size:18px;font-weight:bold">
						$direccionEmpresa
					</span>
					<br>
					<span style="color:black;font-size:14px;font-weight:bold">
						J-$RFCEmpresa
					</span>
					<br>
					<span style="color:black;font-size:18px;font-weight:bold">
						Telefono: $TelefonoEmpresa
					</span>
				</div>
				</td>
				<td style="width:25%; text-align:center;">
					<span style="color:black;font-weight:bold;font-size:21px;">FACTURA #$codigo</span>
				</td>
			</tr>
		</table>
	EOF;

	$pdf->writeHTML($bloque1, false, false, false, false, '');

	// ---------------------------------------------------------

	$bloque2 = <<<EOF
		<table>
			<tr>
				<td style="width:540px"><img src="images/back.jpg"></td>
			</tr>
		</table>

		<table style="font-size:20px; font-weight:bold; padding:0px 10px; width: 100%;">	
			<tr>
				<td style="width: 100%; background-color:#000000; padding: 4px 4px 4px; font-weight:bold;  color:white;">FACTURAR A</td>
			</tr>
			<tr>	
				<td >
					Cliente: $respuestaCliente[nombre]
					<br>
					Direccion: $respuestaCliente[direccion]
					<br>
					Telefono: $respuestaCliente[telefono]
					<br>
					E-Mail: $respuestaCliente[email]
					<br>
				</td>
			</tr>
			<tr>
				<td style="width: 35%; background-color:#000000; padding: 4px 4px 4px; font-weight:bold;  color:white;">VENDEDOR:</td>
				<td style="width: 25%; background-color:#000000; padding: 4px 4px 4px; font-weight:bold;  color:white;">FECHA </td>
				<td style="width: 40%; background-color:#000000; padding: 4px 4px 4px; font-weight:bold;  color:white;">FORMA DE PAGO</td>
			</tr>	
			<tr>
				<td>$respuestaVendedor[nombre]</td>
				<td>$fecha</td>
				<td>$metodoPago</td>
			</tr>
			<tr>
				<td style="border-bottom: 1px solid #666; background-color:white; width:540px"></td>
			</tr>
		</table>

	EOF;

	$pdf->writeHTML($bloque2, false, false, false, false, '');

	// ---------------------------------------------------------

	$bloque3 = <<<EOF

		<table style="font-size:20px; font-weight: bold; padding:5px 10px; width: 100%;">
			<tr>
				<td style="background-color:#000000; padding: 4px 4px 4px; font-weight:bold;  color:white; text-align:center">Producto</td>
				<td style="background-color:#000000; padding: 4px 4px 4px; font-weight:bold;  color:white; text-align:center">Cantidad</td>
				<td style="background-color:#000000; padding: 4px 4px 4px; font-weight:bold;  color:white; text-align:center">Valor Unit.</td>
				<td style="background-color:#000000; padding: 4px 4px 4px; font-weight:bold;  color:white; text-align:center">Valor Total</td>
			</tr>

		</table>

	EOF;

	$pdf->writeHTML($bloque3, false, false, false, false, '');

	// ---------------------------------------------------------
	$contador=0;
	foreach ($productos as $key => $item) {

	$contador=$contador+1;
	$itemProducto = "descripcion";
	$valorProducto = $item["descripcion"];
	$orden = null;

		if ($contador%2==0){
			$clase='style="background-color:#FFFFFF; padding: 3px 4px 3px; ';
		} else {
			$clase='style="background-color:white; padding: 3px 4px 3px; ';
		}

	$respuestaProducto = ControladorProductos::ctrMostrarProductos($itemProducto, $valorProducto, $orden);

	$valorUnitario = number_format($respuestaProducto["precio_venta"], 2);

	$precioTotal = number_format($item["total"], 2);

	$bloque4 = <<<EOF
		<table style="font-size:20px; font-weight: bold; padding:5px 10px;">
			<tr>
				<td $clase text-align:center">$item[descripcion]</td>
				<td $clase text-align:center">$item[cantidad]</td>
				<td $clase text-align:center">$ $item[precio]</td>
				<td $clase text-align:center">$ $precioTotal</td>
			</tr>
		</table>
	EOF;

	$pdf->writeHTML($bloque4, false, false, false, false, '');

	}

	// ---------------------------------------------------------
	$bloque5 = <<<EOF
		<br><br>
		<table border=1 style="font-size: 24px; font-weight: bold; padding: 6px; width: 50%; boder: 1px solid #666; border-collapse: collapse;">
			<tr style="boder: 1px solid #666; border-collapse: collapse;">
				<td style="boder: 1px solid #666; border-collapse: collapse;">Neto: </td>
				<td style="boder: 1px solid #666; border-collapse: collapse;">$ $neto</td>
			</tr>
			<tr style="boder: 1px solid #666; border-collapse: collapse;">
				<td style="boder: 1px solid #666; border-collapse: collapse;">Impuesto: </td>
				<td style="boder: 1px solid #666; border-collapse: collapse;">$ $impuesto</td>
			</tr>
			<tr style="boder: 1px solid #666; border-collapse: collapse;">
				<td style="boder: 1px solid #666; border-collapse: collapse;">Total: </td>
				<td style="boder: 1px solid #666; border-collapse: collapse;">$ $total</td>
			</tr>
			<tr style="boder: 1px solid #666; border-collapse: collapse;">
				<td style="boder: 1px solid #666; border-collapse: collapse;">Total Bs: </td>
				<td style="boder: 1px solid #666; border-collapse: collapse;">$total_ves Bs</td>
			</tr>
		</table>
	EOF;
	
	$bloque6 = <<<EOF
		<br>
		<div style="font-size:22px;text-align:center;font-weight:bold">Gracias por su compra!</div>
		<br>
	EOF;

	$pdf->writeHTML($bloque5, false, false, false, false, '');
	$pdf->writeHTML($bloque6, false, false, false, false, '');



	// ---------------------------------------------------------
	//SALIDA DEL ARCHIVO 

	//CORRIGE ERROR 17778 TCPDF ERROR: Some data has already been output, can't send PDF file
	ob_end_clean();

	//$pdf->Output('factura.pdf', 'D');


	$pdf->Output(getcwd().'/PDF/factura'.$valorVenta.'.pdf', 'FI');

	}

}

$factura = new imprimirFactura();
$factura -> codigo = $_GET["codigo"];
$factura -> traerImpresionFactura();

?>
