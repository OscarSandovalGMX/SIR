﻿$(document).ready(function () {
    PageLoadMaster();
});

//Evento Inicial en Master
function PageLoadMaster() {
    fn_EstadoVentanas();

    $(".Fecha").datepicker({
        showOn: 'focus',
        buttonImageOnly: false,
        dateFormat: 'dd/mm/yy',
        numberOfMonths: 1,
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo',
                        'Junio', 'Julio', 'Agosto', 'Septiembre',
                        'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr',
                            'May', 'Jun', 'Jul', 'Ago',
                            'Sep', 'Oct', 'Nov', 'Dic']
    });

    $(".Fecha").mask("99/99/9999");

    //Botón Aceptar en Catalogo
    $("[id*=btn_Aceptar_Catalogo]").click(function () {
        var varSeleccion = '';
        var Filas = $("[id*=gvd_Catalogo]")[0].rows;

        for (i = 0; i <= Filas.length - 2; i++) {
            if ($('[id*=chk_Cat]')[i].checked == true) {
                varSeleccion = varSeleccion + $('[id*=lbl_ClaveCat]')[i].innerText + '~' +
                                                $('[id*=lbl_DesCat]')[i].innerText + '|';
            }
        }

        $("input[id$='hid_Seleccion']")[0].value = varSeleccion
        __doPostBack(this.name, '');
    });
}


//Ventana de Mensajes
function fn_MuestraMensaje(Titulo, Mensaje, Tipo, boton) {

    document.getElementById('lbl_TituloMensaje').innerHTML = Titulo;
    document.getElementById('lbl_Mensaje').innerHTML = Mensaje;

    document.getElementById('img_advertencia').style.display = 'none';
    document.getElementById('img_confirma').style.display = 'none';
    document.getElementById('img_error').style.display = 'none';
    document.getElementById('img_pregunta').style.display = 'none';

    document.getElementById('btn_Si').style.display = 'none';
    document.getElementById('btn_No').style.display = 'none';

    //Almacena el control que desplego el Mensaje de Confirmación
    if (boton != undefined)
    {
        document.getElementById('hid_ControlASP').value = boton;
    }

    //Evalua el tipo de Mensaje
    switch (Tipo) {
        case 0:
            document.getElementById('img_advertencia').style.display = 'block';
            break;
        case 1:
            document.getElementById('img_confirma').style.display = 'block';
            break;
        case 2:
            document.getElementById('img_error').style.display = 'block';
            break;
        case 3:
            document.getElementById('img_pregunta').style.display = 'block';
            document.getElementById('btn_Si').style.display = 'inline-block';
            document.getElementById('btn_No').style.display = 'inline-block';
            break;
    }
    
    fn_AbrirModal('#Mensajes');
    $('#Mensajes').draggable();
}

//Respuesta del Usuario en Mensaje de Confirmación
function fn_Repuesta() {
    fn_CerrarModal('#Mensajes');
    __doPostBack(document.getElementById('hid_ControlASP').value, '');
}

//Funciones de Consulta--------------------------------------------------------------------------------------------------------------------------------
function fn_CargaCatalogo(Consulta, Tipo , Control, Prefijo, Titulo) {
    $.ajax({
        type: 'POST',
        contentType: "application/json; charset=utf-8",
        url: 'Login.aspx/ObtieneDatos',
        data: "{ 'Consulta': '" + Consulta + "'}",
        dataType: 'JSON',
        success: function (response) {
            if (response.d.length > 0) {
                $("#lbl_Catalogo")[0].innerText = Titulo;
                $("input[id$='hid_Control']")[0].value = Control;
                $("input[id$='hid_Prefijo']")[0].value = Prefijo;
                fn_AbrirModal('#Catalogo');

                $("[id*=gvd_Catalogo] tr").not($("[id*=gvd_Catalogo] tr:first")).remove();
                for (var i = 0; i < response.d.length; i++) {
                    $("[id*=gvd_Catalogo]").append('<tr>' +
                                                        '<td><input type="checkbox" id="chk_Cat" class="Select" onclick="fn_CambioSeleccion(this,' + "'" + Tipo + "'" + ')" /></td>' +
                                                        '<td><label id="lbl_ClaveCat" class="texto-catalogo" style="Width:75px;">' + response.d[i].Clave + '</label></td>' +
                                                        '<td><label id="lbl_DesCat" class="texto-catalogo" style="Width:205px;">' + response.d[i].Descripcion + '</label></td>' +
                                                   '</tr>')
                };
                //Reference the GridView.
                var gridView = $("[id*=gvd_Catalogo]");

                //Reference the first row.
                var row = gridView.find("tr").eq(1);

                if ($.trim(row.find("td").eq(0).html()) == "") {
                    row.remove();
                }
                $('[id$=gvd_Catalogo]').tablePagination({});
                $('[id$=gvd_Catalogo]').each(function () {
                    $('tr:odd', this).addClass('odd').removeClass('even');
                    $('tr:even', this).addClass('even').removeClass('odd');
                })
                fn_CerrarModal('#EsperaModal');

            }
            else {
                fn_MuestraMensaje('Catálogo', 'No se encontraron registros',0);
                fn_CerrarModal('#EsperaModal');
            }
        },
        error: function (e) {
            fn_MuestraMensaje('Catálogo', e.responseText, 2);
            fn_CerrarModal('#EsperaModal');
        }
    });
    return false;
};

//Cambio de selección de elemento en Catalogo
function fn_CambioSeleccion(Control, TipoSeleccion) {
    //Get target base & child control.

    var row = $(Control).closest("tr");

    var Gread = document.getElementById($('[id$=gvd_Catalogo]')[0].id)

    //Evalua el tipo de seleccion
    if (TipoSeleccion == "Unica") {
        fn_SeleccionGread(Gread, false)
        fn_SeleccionarElemento(row[0].rowIndex)
    }
    return false;
}


function fn_SeleccionGread(Control, Valor) {
    //Get target base & child control.
    var TargetChildControl = "chk_Cat";

    if (Control == null) {
        fn_MuestraMensaje('no hay elementos', e.responseText, 2);
    }

    if (Control != null) {
        //Get all the control of the type INPUT in the base control.
        var Inputs = Control.getElementsByTagName("input");

        //Checked/Unchecked all the checkBoxes in side the GridView.
        for (var n = 0; n < Inputs.length; ++n)
            if (Inputs[n].type == 'checkbox' && Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                Inputs[n].checked = Valor;
    }
    return false;
}


//Selecciona solo un elemento en caso de ser seleccion Unica
function fn_SeleccionarElemento(rowIndex) {
    $("[id*=gvd_Catalogo] tr").each(function (e) {
        var row = $(this).closest("tr");
        if (row[0].rowIndex == rowIndex) {
            var Select = row.find('.Select');
            $(Select)[0].checked = true;
        }
    })
    return false;
}

//Abrir Modal
function fn_AbrirModal(modal) {
    $(modal).modal('show');
}

//Cerrar Modal
function fn_CerrarModal(modal) {
    $(modal).modal('hide');
}

//Cambia Estado de Ventana
function fn_CambiaEstado(IdControl, Colapsado) {
    $('.ventana' + IdControl).slideToggle();

    var Ventana = $("input[id$='hid_Ventanas']")[0].value;
    var Estado = Ventana.split("|");

    Estado[IdControl] = Colapsado

    $("input[id$='hid_Ventanas']")[0].value = "";

    for (i = 0; i < Estado.length - 1; i++) {
        $("input[id$='hid_Ventanas']")[0].value = $("input[id$='hid_Ventanas']")[0].value + Estado[i] + "|";
    }

    if (Colapsado == "1") {
        $("#coVentana" + IdControl).hide();
        $("#exVentana" + IdControl).show();
    }
    else {
        $("#coVentana" + IdControl).show();
        $("#exVentana" + IdControl).hide();
    }
}

//Funciones Estado-------------------------------------------------------------------------------------------------------------------------------------
function fn_EstadoVentanas() {
    var Ventana = $("input[id$='hid_Ventanas']")[0].value;
    var Estado = Ventana.split("|");

    for (i = 0; i < Estado.length - 1; i++) {
        if (Estado[i] == "1") {
            $('.ventana' + i).hide();
            $("#coVentana" + i).hide();
            $("#exVentana" + i).show();
        }
        else {
            $("#coVentana" + i).show();
            $("#exVentana" + i).hide();
        }
    }
}

//Evalua los elementos ya seleccionados para una Consulta
function fn_ElementosSeleccionados(Gread, Control, Seleccion, blnTexto) {
    var caracter = '';

    if (blnTexto == true) { caracter = '===='; }

    var strSel = caracter + '-1' + caracter;

    if (Gread.length > 0) {
        var Filas = Gread[0].rows;
        for (i = 0; i <= Filas.length - 2; i++) {
            var Clave = Control[i].innerText;
            var chk_Sel = Seleccion[i].value

            //Verifica que no haya sido descartado de la lista
            if (chk_Sel != 'true') { strSel = strSel + ',' + caracter + Clave + caracter; }
        }
    }

    if (strSel == caracter + '-1' + caracter) { strSel = ''; }
    else { strSel = ",==" + strSel + "=="; }

    return strSel;
}