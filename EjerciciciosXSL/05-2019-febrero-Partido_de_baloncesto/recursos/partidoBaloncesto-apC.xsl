<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="partidoBaloncesto">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
                <title>partido de baloncesto</title>
                    <xsl:call-template name="disenio"/><!-- ///style/// -->
            </head>
            <body>
                <div>
                    <xsl:attribute name="style">width: 1000px; margin: 0 auto;</xsl:attribute>
                    <h1><!-- ///TITULO/// -->
                        <xsl:attribute name="align">center</xsl:attribute> Baloncesto: Baloncesto
                        Lucena 2 - Unicaja Baloncesto </h1>
                    <!-- ///TITULO/// -->
                    
                   
                    
                </div>
            </body>
        </html>
        

    </xsl:template>
    
    
    
    <!-- /////////////////////////TEMPLATES///////////////////////// -->
    
    <!-- *********************BUCLE FOR******************* -->
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 11"> <!-- Asta que la i sea x -->
            <tr>
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                    <xsl:with-param name="j">1</xsl:with-param> <!-- Valor inicial para l j -->
                </xsl:call-template>
            </tr>
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param> <!-- por cada vuelta sumo x -->
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/> 
        <xsl:if test="$j &lt;= 8"> <!-- Asta que la j sea x -->
            <xsl:call-template name="celda">
                <xsl:with-param name="x"><xsl:value-of select="$j"/></xsl:with-param> <!-- la j tendra el valor de la cordenada x es decir la filas -->
                <xsl:with-param name="y"><xsl:value-of select="$i"/></xsl:with-param> <!-- la i tendra el valor de la cordenada y es decir las columnas -->
            </xsl:call-template>
            <xsl:call-template name="bucleForColumna">
                <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param> <!-- por cada vuelta sumo x -->
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td>
            <xsl:for-each select="loquesadentrodelbucle">
                <xsl:if test="@x = $x and @y = $y"> <!-- si las variables x e y coinciden con los atributos del elemento ago algo -->
                    <td>
                        <img>
                            <xsl:attribute name="src"><xsl:value-of select="equipo/@imagen"/></xsl:attribute>
                        </img>
                    </td>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    <!-- *********************BUCLE FOR******************* -->

    <!-- //////////////////STYLE//////////////////// -->
    <xsl:template name="disenio">
        <style type="text/css">
            body {
            font-family: Arial;
            font-size: 11px;
            }
            
            table img {
            width: 40px;
            }
            
            th {
            background: #1e3356;
            color: #FFFFFF;
            }
            
            #tablaCancha {
            color: #eff4fc;
            }
            
            ol,
            ul {
            margin-top: 10px;
            margin-left: 0px;
            }
            
            #menu li {
            margin-left: 0px;
            display: inline;
            list-style-type: none;
            padding: 10px 50px;
            }
            
            .noticia {
            /* border: #000 solid 1px; */
            padding: 10px 5px;
            float: left;
            width: 338px;
            }
            
            .noticia img {
            width: 338px;
            }
            
            .noticiaDobleAncho {
            /* border: #000 solid 1px; */
            padding: 10px 5px;
            float: left;
            width: 690px;
            }
            
            .noticiaDobleAncho img {
            width: 690px;
            }
            
            .fechaNoticia {
            color: #A3A34B;
            }
            
            .comentariosNoticia {
            color: #A3A34B;
            padding-left: 20px;
            }
            
            .divPublicidad {
            /* border: #000 solid 1px; */
            padding: 10px 5px;
            float: right;
            width: 280px;
            }
            
            .divPublicidad img {
            width: 200px;
            }
        </style>
        <!-- //////////////////STYLE//////////////////// -->
    </xsl:template>
    
</xsl:stylesheet>