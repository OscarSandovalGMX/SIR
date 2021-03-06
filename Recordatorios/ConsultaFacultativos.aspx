﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="ConsultaFacultativos.aspx.vb" Inherits="Recordatorios_ConsultaFacultativos" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" Runat="Server">
             <script src="../Scripts/jquery.maskedinput.js"></script>
             <script src="../Scripts/jquery.numeric.js"></script>
             <script src="../Scripts/Facultativos.js"></script>
     
            <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|1|1|1|1|1|1|" />

            <div class="cuadro-titulo panel-encabezado ventana0">
                Consulta de Facultativos
 
                 <asp:HiddenField runat="server" ID="hid_Clave" Value="" />
            </div>
            <div class="clear padding10"></div>
            <div style="width:1000px; min-width:1000px; overflow-x:hidden">
                 <div class="row">
                    <div class="col-md-6">
                        <asp:UpdatePanel runat="server" ID="upd_Opc">
                         <ContentTemplate>
                               <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="150px">Tipo de Consulta: </asp:Label>
                                <asp:RadioButton runat="server" ID="opcFac" CssClass="etiqueta-control" Text=" Facultativos" Checked="true" OnCheckedChanged="opcFac_CheckedChanged" AutoPostBack ="true" />
                                <asp:RadioButton runat="server" ID="opcEsp" CssClass="etiqueta-control" Text=" Especiales" OnCheckedChanged="opcEsp_CheckedChanged" AutoPostBack ="true" />
                                 <asp:LinkButton id="btn_CargaConsulta" runat="server" class="btn botones ">
                                     <span>
                                        <img class="btn-cargar"/>
                                        Existente
                                     </span>
                                 </asp:LinkButton>
                         </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            
             <div class="clear padding10"></div>

            <%--Seccion 1--%>
              <div class="row">
                    <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                                <input type="image" src="../Images/contraer_mini.png" id="coVentana1" class="contraer"  />
                                <input type="image" src="../Images/expander_mini.png"   id="exVentana1" class="expandir"  />
                            Broker
                        </div>
                        <div class="panel-subcontenido ventana1">
                                <asp:UpdatePanel runat="server" ID="upBroker">
                                    <ContentTemplate>
                                        <asp:Panel runat="server" ID="pnlBroker" Width="100%" Height="130px" ScrollBars="Both">
                                                <asp:GridView runat="server" ID="gvd_Broker" AutoGenerateColumns="false" 
                                                              CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                              GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="">
                                                            <ItemTemplate>
                                                                    <asp:HiddenField runat="server" ID="chk_SelBro" value="false"/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField >
                                                        <asp:TemplateField HeaderText="Clave">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lbl_ClaveBro" Text='<%# Eval("Clave") %>' Width="50px" Font-Size="10px" ></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Descripción">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px" Font-Size="10px"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </asp:Panel>
                                            <div style="width:100%;  text-align:right">
                                                <asp:LinkButton id="btn_AddBroker" runat="server" class="btn botones AgregaBroker" data-toggle="modal" data-target="#EsperaModal">
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                        Añadir
                                                    </span>
                                                </asp:LinkButton>
                                            </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                        </div>
                    </div>

                   <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            <input type="image" src="../Images/contraer_mini.png" id="coVentana2" class="contraer"  />
                            <input type="image" src="../Images/expander_mini.png"   id="exVentana2" class="expandir"  />
                            Compañia
                        </div>
                        <div class="panel-subcontenido ventana2">
                            <asp:UpdatePanel runat="server" ID="upCia">
                            <ContentTemplate>
                                    <asp:Panel runat="server" ID="pnlCompañia" Width="100%" Height="130px" ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Compañia" AutoGenerateColumns="false" 
                                                        CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                        GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="chk_SelCia" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveCia" Text='<%# Eval("Clave") %>' Width="50px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>        
                                    <div style="width:100%;  text-align:right">
                                            <asp:LinkButton id="btn_AddCia" runat="server" class="btn botones AgregaCia" data-toggle="modal" data-target="#EsperaModal">
                                                <span>
                                                    <img class="btn-añadir"/>
                                                    Añadir
                                                </span>
                                            </asp:LinkButton>
                                    </div>
                            </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                   </div>
              </div>
            
             <div class="clear padding10"></div>
            <%--Seccion 2--%>
              <div class="row">
                  <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            <input type="image" src="../Images/contraer_mini.png" id="coVentana3" class="contraer"  />
                            <input type="image" src="../Images/expander_mini.png"   id="exVentana3" class="expandir"  />
                            Ramo Contable
                        </div>
                        <div class="panel-subcontenido ventana3">
                             <asp:UpdatePanel runat="server" ID="upRamoContable">
                                <ContentTemplate>
                                     <asp:Panel runat="server" ID="pn_RamoContable" Width="100%" Height="130px" ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_RamoContable" AutoGenerateColumns="false" 
                                                      CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                      GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                            <asp:HiddenField runat="server" ID="chk_SelRamC" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveRamC" Text='<%# Eval("Clave") %>' Width="80px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="280px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <div style="width:100%;  text-align:right">
                                        <asp:LinkButton id="btn_AddRamoContable" runat="server" class="btn botones AgregaRamoCont" data-toggle="modal" data-target="#EsperaModal">
                                            <span>
                                                <img class="btn-añadir"/>
                                                Añadir
                                            </span>
                                        </asp:LinkButton>
                                    </div>
                                </ContentTemplate>
                             </asp:UpdatePanel>
                        </div>
                  </div>
                   <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            <input type="image" src="../Images/contraer_mini.png" id="coVentana4" class="contraer"  />
                            <input type="image" src="../Images/expander_mini.png"   id="exVentana4" class="expandir"  />
                            Póliza
                        </div>
                        <div class="panel-subcontenido ventana4">
                                <asp:UpdatePanel runat="server" ID="upPoliza">
                                    <ContentTemplate>
                                        <asp:HiddenField runat="server" ID="hid_Polizas" Value="" />
                                        <asp:HiddenField runat="server" ID="hid_HTML" Value="" />
                                        <div class="clear padding5"></div>

                                        <asp:Panel runat="server" ID="pnlPoliza" Width="100%" Height="140px" ScrollBars="Both">
                                                <asp:GridView runat="server" ID="gvd_Poliza" AutoGenerateColumns="false" 
                                                              CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern"
                                                              GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="" ItemStyle-CssClass="SelCia">
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="chk_SelPol" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Clave" ItemStyle-CssClass="ClaveCia">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lbl_ClavePol" Text='<%# Eval("Clave") %>' Width="100px" Font-Size="9.5px" ></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Grupo Endoso">
                                                            <ItemTemplate>
                                                                <asp:label runat="server" ID="lbl_DescripcionPol" Enabled="false" Text='<%# Eval("Descripcion")   %>' Width="260px" Font-Size="9.5px"  ></asp:label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Id_Pv" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:label runat="server" ID="lbl_idpv" Enabled="false" Text='<%# Eval("id_pv")   %>' Width="260px" Font-Size="9.5px"  ></asp:label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </asp:Panel>
                                            <div style="width:100%;  text-align:right">
                                                 <asp:LinkButton id="btn_PolDescart" runat="server" class="btn botones boton-mediano">
                                                    <span>
                                                        <img class="btn-todos"/>
                                                        Descartadas
                                                    </span>
                                                </asp:LinkButton>
                                                <asp:LinkButton id="btn_AddPol" runat="server" class="btn botones">
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                        Añadir
                                                    </span>
                                                </asp:LinkButton>

                                            </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>       
                        </div>           
                  </div>
                </div>
                            
             <div class="clear padding10"></div>

              <div class="row">               
                   <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            <input type="image" src="../Images/contraer_mini.png" id="coVentana5" class="contraer"  />
                            <input type="image" src="../Images/expander_mini.png"   id="exVentana5" class="expandir"  />
                            Asegurados
                        </div>
                        <div class="panel-subcontenido ventana5">
                            <asp:UpdatePanel runat="server" ID="updAsegurado">
                                <ContentTemplate>
                                   <div class="form-group">
                                    <div class="input-group">
                                       <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="80px">Asegurado: </asp:Label>
                                       <asp:HiddenField runat="server" ID="hidClaveAse"></asp:HiddenField>
                                       <asp:TextBox runat="server" ID="txtSearchAse" CssClass="form-control" Width="260px" Height="26px"></asp:TextBox>
                                         <asp:LinkButton id="btn_AgregarAse" runat="server" class="btn botones">
                                                    <span>
                                                        <img class="btn-añadir"/>
                                                        Añadir
                                                    </span>
                                         </asp:LinkButton>
                                   </div>
                                 </div>
                                 <asp:Panel runat="server" ID="pnlAse" Width="100%" Height="130px" ScrollBars="Both">
                                    <asp:GridView runat="server" ID="gvd_Asegurado" AutoGenerateColumns="false" CssClass="grid-view" HeaderStyle-CssClass="header" DataKeyNames="Clave,Descripcion"  
                                              AlternatingRowStyle-CssClass="altern" GridLines="Horizontal"  ShowHeaderWhenEmpty="true" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelAse" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Clave">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_ClaveAse" Text='<%# Eval("Clave") %>' Width="50px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Desc" Text='<%# Eval("Descripcion") %>' Width="310px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:imagebutton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" Height="26" runat="server" CssClass="btn Delete" />
                                                     </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                  
                    </div>
                     <div class="col-md-6">
                        <div class="cuadro-subtitulo">
                            <input type="image" src="../Images/contraer_mini.png" id="coVentana6" class="contraer"  />
                            <input type="image" src="../Images/expander_mini.png"   id="exVentana6" class="expandir"  />
                            Adicionales
                        </div>
                        <div class="panel-subcontenido ventana6">
                             <asp:UpdatePanel runat="server" ID="updAdicionales">
                                <ContentTemplate>
                                   <div class="form-group">
                                    <div class="input-group">
                                        <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="80px">Siniestro: </asp:Label>
                                         <asp:TextBox runat="server" ID="txt_NoSiniestro" CssClass="form-control LetraDetalle Derecha" Width="260px" Height="26px"></asp:TextBox>
                                    </div>
                                   </div>
                                </ContentTemplate>
                             </asp:UpdatePanel>
                         </div>
                    </div>

                  </div> 

                <div class="clear padding20"></div>
             <div style="width:100%; text-align:right; border-top-style:inset; border-width:1px; border-color:#003A5D">
                    <asp:UpdatePanel runat="server" ID="upBotones">
                        <ContentTemplate>
                             <asp:LinkButton id="btn_Buscar" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-buscar"/>
                                    Consultar
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton id="btn_GuardarCons" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-guardar"/>
                                    Guardar
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton id="btn_CancelaFac" runat="server" class="btn botones">
                                <span>
                                    <img class="btn-cancelar"/>
                                    Cancelar
                                </span>
                            </asp:LinkButton>
                         </div>
                     </ContentTemplate>
                </asp:UpdatePanel>
            </div> 
               
                <div class="clear padding10"></div>
                <div>
                    <asp:label runat="server" class="col-md-1 etiqueta-control" Width="100px">VISTA PREVIA:</asp:label>
                </div>
                
                <div class="row" >
                    <div class="col-md-12"> 
                        <asp:UpdatePanel runat="server" ID="upSiniestros">
                            <ContentTemplate>
                                 <asp:Panel runat="server" ID="pnlSiniestros" Width="100%"  ScrollBars="Both">
                                        <asp:GridView runat="server" ID="gvd_Siniestros" AutoGenerateColumns="false" CssClass="grid-view" HeaderStyle-CssClass="header" 
                                            AlternatingRowStyle-CssClass="altern" GridLines="Horizontal"  ShowHeaderWhenEmpty="false" AllowPaging="true" PageSize="10"
                                            DataKeyNames="">
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="chk_SelSin" value="false"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderText="Siniestro">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Siniestro" Text='<%# Eval("SINIESTRO") %>' Width="70px" Font-Size="10px" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sub">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Subsiniestro" Text='<%# Eval("SUBSINIESTRO") %>' Width="30px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Sucursal">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Sucursal" Text='<%# Eval("SUCURSAL") %>' Width="160px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Ramo">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Ramo" Text='<%# Eval("RAMO") %>' Width="220px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Poliza">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Poliza" Text='<%# Eval("POLIZA") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Sufijo">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Sufijo" Text='<%# Eval("SUFIJO") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Endoso">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbl_Endoso" Text='<%# Eval("ENDOSO") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Ubicación">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label1" Text='<%# Eval("UBICACION") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Evento">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label2" Text='<%# Eval("EVENTO_CAT") %>' Width="70px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Fecha Mov">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label3" Text='<%# Eval("FEC_MOV") %>' Width="70px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Moneda">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label4" Text='<%# Eval("MONEDA") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Ramo Contable">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label5" Text='<%# Eval("COD_RAMO_CONTABLE") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Contrato">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label6" Text='<%# Eval("CONTRATO") %>' Width="70px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label7" Text='<%# Eval("DESCRIP_CONTRATO") %>' Width="280px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Reasegurador">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label8" Text='<%# Eval("REASEGURADOR") %>' Width="280px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Corredor">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label9" Text='<%# Eval("CORREDOR") %>' Width="350px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Estimación">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label10" Text='<%# Eval("ESTIMACION") %>' Width="150px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Movimiento">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label11" Text='<%# Eval("MOVIMIENTO") %>' Width="120px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Solicitud">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label12" Text='<%# Eval("SOLICITUD_PAGO") %>' Width="80px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Monto Mov">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label13" Text='<%# Eval("MONTO_MOVIMIENTO") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Monto Rea">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label14" Text='<%# Eval("MONTO_REASEGURO") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Monto MovEQ">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label15" Text='<%# Eval("MONTO_MOVIMIENTO_EQ") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Monto ReaEQ">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label16" Text='<%# Eval("MONTO_REASEGURO_EQ") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Monto RetEQ">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label17" Text='<%# Eval("MONTO_RETENIDA_EQ") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Fecha Ocur">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label18" Text='<%# Eval("FECHA_OCURRENCIA") %>' Width="70px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Registro REA">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label19" Text='<%# Eval("REG_REASEGURADOR") %>' Width="100px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Registro COR">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label20" Text='<%# Eval("REG_CORREDOR") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asegurado">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label21" Text='<%# Eval("ASEGURADO") %>' Width="270px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cobertura">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label22" Text='<%# Eval("COBERTURA") %>' Width="200px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tipo Cambio">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label23" Text='<%# Eval("TIPO_CAMBIO") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CodCia">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label24" Text='<%# Eval("cod_cia_reas_cia") %>' Width="50px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CodAgente">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label25" Text='<%# Eval("cod_agente") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CodTContrato">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label26" Text='<%# Eval("cod_tipo_contrato") %>' Width="60px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fecha Ini">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label27" Text='<%# Eval("FEC_INI_VIG") %>' Width="70px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fecha Fin">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label28" Text='<%# Eval("FEC_FIN_VIG") %>' Width="70px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Pais">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label29" Text='<%# Eval("PAIS") %>' Width="100px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Causa">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label30" Text='<%# Eval("CAUSA_STRO") %>' Width="180px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Dirección">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label31" Text='<%# Eval("DIR_STRO") %>' Width="350px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fecha Aviso">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label32" Text='<%# Eval("FEC_AVISO") %>' Width="70px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Ajustador">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label33" Text='<%# Eval("AJUSTADOR") %>' Width="280px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Riesgo">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label34" Text='<%# Eval("RIESGO") %>' Width="250px" Font-Size="10px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle CssClass="pager" />
                                            <PagerSettings Mode="NumericFirstLast" FirstPageText="Primero" LastPageText="Ultimo" />
                                        </asp:GridView>
                                 </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        
                        <div class="clear padding30"></div>
                        <div class="clear padding30"></div>
                        <div class="clear padding30"></div>
                    </div>
                </div>
          </div>
                 <!-- Modal -->
                <div id="DescartadasModal" style="width:920px; height:400px"  class="modal-ajustes">
                        <div class="cuadro-titulo" style="height:40px">
                            <button type="button" class="close"  data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">
                                    Pólizas Descartadas para Aviso de Cobro
                                </h4>
                        </div>
                        <div class="modal-body" style="height:398px">
                               <asp:UpdatePanel runat="server" ID="upDescartadas">
                                   <ContentTemplate>

                                      <asp:Panel runat="server" ID="pnlDescartadas" Width="100%" Height="300px" ScrollBars="Both">
                                          <asp:GridView runat="server" ID="gvd_Descartadas" AutoGenerateColumns="false" CssClass="grid-view" HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern" 
                                              GridLines="Horizontal"  ShowHeaderWhenEmpty="false" >
                                            <Columns>
                                                   <asp:TemplateField HeaderText="" ItemStyle-CssClass="SelCia">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chk_SelPol" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Endoso" ItemStyle-CssClass="ClaveCia">
                                                        <ItemTemplate>
                                                            <asp:label runat="server" ID="lbl_Poliza" Text='<%# Eval("Poliza") %>' Width="100px" Font-Size="10px"></asp:label>
                                                            <asp:HiddenField runat="server" ID="hid_idpv" Value='<%# Eval("id_pv") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Asegurado">
                                                        <ItemTemplate>
                                                                <asp:label runat="server" ID="lbl_Asegurado" Enabled="false" Text='<%# Eval("Asegurado")   %>' Width="300px" Font-Size="10px" Height="26px" ></asp:label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Grupo">
                                                        <ItemTemplate>
                                                                <asp:label runat="server" ID="lbl_GrupoEndoso" Enabled="false" Text='<%# Eval("GrupoEndoso")   %>' Width="220px" Font-Size="10px" Height="26px" ></asp:label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                   <asp:TemplateField HeaderText="Tipo">
                                                        <ItemTemplate>
                                                                <asp:label runat="server" ID="lbl_GrupoTipoEndoso" Enabled="false" Text='<%# Eval("TipoEndoso")   %>' Width="220px" Font-Size="10px" Height="26px" ></asp:label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Usuario">
                                                        <ItemTemplate>
                                                                <asp:label runat="server" ID="lbl_Usuario" Text='<%# Eval("Usuario")   %>' Enabled="false" Width="220px" Font-Size="10px" Height="26px" ></asp:label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Fecha">
                                                        <ItemTemplate>
                                                                <asp:label runat="server" ID="lbl_Fecha" Text='<%# Eval("Fecha")   %>' Width="80px" CssClass="form-control" Font-Size="10px" Height="26px" ></asp:label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                      </asp:Panel>

                                      <div style="width:100%; text-align:right;">
                                         <%--<asp:Button runat="server" id="btn_QuitarNoPago" class="btn btn-success" Text="Quitar"  style="height:30px; width:80px;" />--%>
                                           <asp:LinkButton id="btn_QuitarNoPago" runat="server" class="btn botones">
                                                                <span>
                                                                    <img class="btn-quitar"/>
                                                                    Quitar
                                                                </span>
                                           </asp:LinkButton>
                                         <%--<asp:Button runat="server" id="btn_CerrarNoPago" class="btn btn-danger" Text="Cerrar" data-dismiss="modal"  style="height:30px; width:80px;" />--%>
                                           <asp:LinkButton id="btn_CerrarNoPago" runat="server" class="btn botones">
                                                                <span>
                                                                    <img class="btn-cancelar"/>
                                                                    Cerrar
                                                                </span>
                                           </asp:LinkButton>
                                      </div>
                                   </ContentTemplate>
                                </asp:UpdatePanel>
                          </div>
                      </div> 
                    <%-- fin de modal--%>

      

</asp:Content>

