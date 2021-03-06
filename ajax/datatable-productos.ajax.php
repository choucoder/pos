<?php

require_once "../controladores/productos.controlador.php";
require_once "../modelos/productos.modelo.php";

require_once "../controladores/categorias.controlador.php";
require_once "../modelos/categorias.modelo.php";


class TablaProductos {

  public function mostrarTablaProductos() {

    $item = null;
    $valor = null;
    $orden = "id";
        
    $request = $_REQUEST;
        
    $totalRenglones = ModeloProductos::mdlMostrarNumRegistros($request);
    
    if ($totalRenglones["totalRenglones"] == 0) {
      echo '{"data": [], "empty": "yes"}';
      return;
    }

    $productos = ModeloProductos::mdlMostrarProductosServerSide("productos", $item, $request, $orden);

    $datosJson = '{
        "draw": '.intval($request["draw"]).',
        "recordsTotal":'.intval($totalRenglones["totalRenglones"]).',
        "recordsFiltered": '.intval($totalRenglones["totalRenglones"]).',        
        "data": [';

    $data = array();

    for ($i = 0; $i < count($productos); $i++) {
      $imagen = "<img src='" . $productos[$i]["imagen"] . "' width='40px'>";
      $item = "id";
      $valor = $productos[$i]["id_categoria"];

      $categorias = ControladorCategorias::ctrMostrarCategorias($item, $valor);

      if ($productos[$i]["stock"] <= 10) {

          $stock = "<button class='btn btn-danger'>" . $productos[$i]["stock"] . "</button>";
      } else if ($productos[$i]["stock"] > 11 && $productos[$i]["stock"] <= 15) {

          $stock = "<button class='btn btn-warning'>" . $productos[$i]["stock"] . "</button>";
      } else {

          $stock = "<button class='btn btn-success'>" . $productos[$i]["stock"] . "</button>";
      }

      if (isset($_GET["perfilOculto"]) && $_GET["perfilOculto"] == "Especial") {
          $botones = "<div class='btn-group'><button class='btn btn-warning btnEditarProducto' idProducto='" . $productos[$i]["id"] . "' data-toggle='modal' data-target='#modalEditarProducto'><i class='fa fa-pencil'></i></button></div>";
      } else {
          $botones = "<div class='btn-group'><button class='btn btn-warning btnEditarProducto' idProducto='" . $productos[$i]["id"] . "' data-toggle='modal' data-target='#modalEditarProducto'><i class='fa fa-pencil'></i></button><button class='btn btn-danger btnEliminarProducto' idProducto='" . $productos[$i]["id"] . "' codigo='" . $productos[$i]["codigo"] . "' imagen='" . $productos[$i]["imagen"] . "'><i class='fa fa-times'></i></button></div>";
      }

      $datosJson .= '[
        "' . ($i + 1) . '",
        "' . $imagen . '",
        "' . $productos[$i]["codigo"] . '",
        "' . $productos[$i]["descripcion"] . '",
        "' . $categorias["categoria"] . '",
        "' . $stock . '",
        "' . $productos[$i]["precio_venta"] . '",
        "' . $productos[$i]["fecha"] . '",
        "' . $botones . '"
      ],';

      $data[] = array(
        "i" => ($i + 1),
        "imagen" => $imagen,
        "codigo" => $productos[$i]['codigo'],
        "descripcion" => $productos[$i]['descripcion'],
        "categoria" => $categorias['categoria'],
        "stock" => $stock,
        "precio" => $productos[$i]['precio_venta'],
        "agregado" => $productos[$i]['fecha'],
        "acciones" => $botones,
      );
    }

    $datosJson = substr($datosJson, 0, -1);
    $datosJson .= ']}';
    $response = array(
      "draw" => intval($request['draw']),
      "recordsTotal" => count($productos),
      "recordsFiltered" => count($productos),
      "aaData" => $data,
      "request" => $request,
    );

    echo json_encode($response);
  
  }

}

$activarProductos = new TablaProductos();
$activarProductos->mostrarTablaProductos();

