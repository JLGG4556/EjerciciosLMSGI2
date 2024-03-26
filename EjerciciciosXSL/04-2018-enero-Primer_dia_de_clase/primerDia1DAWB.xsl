<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="primerDia1DAW">
        <html>
            <head>
                <title>Aula 1 DAW</title>
                <style>
                    table, th, td {
                    border: 1px solid black;
                    border-collapse: collapse;
                    text-align: center;
                    } 
                    img {
                    width: 100px;
                    }
                    td {
                    width: 150px;
                    height: 150px;
                    }
                </style>
            </head>
            <body>
                <table>
                    <xsl:call-template name="bucleForFila">
                        <xsl:with-param name="i">1</xsl:with-param> <!-- Valor inicial para la i -->
                    </xsl:call-template>
                </table>
            </body>
        </html>

    </xsl:template>
    
    
    <!-- /////////////////////////////TEMPLATE///////////////////////////////////// -->
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 11"> <!-- Asta que la i sea x -->
            
            <tr> <!-- Aqui estan las fila -->
                
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
        <!-- NOTA: Sacar atributos del for each -->
        <xsl:for-each select="estructuraAula/bloque">
            <xsl:if test="@x = $x and @y = $y">
                <!-- si las variables x e y coinciden con los atributos del elemento ago algo -->
                <xsl:choose>
                    <xsl:when test="@tipo = 'puerta'">
                            <!-- Aqui estan las columnas -->
                            <xsl:attribute name="style">background-color: rgb(255, 75,31)</xsl:attribute> 
                            puerta 
                    </xsl:when>
                    <xsl:when test="@tipo = 'pared'">
                            <xsl:attribute name="style">background-color: rgb(251, 255,0)</xsl:attribute> 
                            pared 
                    </xsl:when>
                    <xsl:when test="@tipo = 'ventana'">
                            <xsl:attribute name="style">background-color: rgb(0, 153,255)</xsl:attribute>
                            ventana
                    </xsl:when>
                </xsl:choose>

            </xsl:if>
        </xsl:for-each>

        <xsl:for-each select="alumnado/alumno">
            <xsl:if test="@x = $x and @y = $y">
                <xsl:choose>
                    <xsl:when test="@sexo = 'H'">
                        
                            <xsl:attribute name="style">background-color: rgb(247,188,247);</xsl:attribute>
                            <xsl:value-of select="."/>
                        
                        <xsl:call-template name="imagen">
                            <xsl:with-param name="sexo"><xsl:value-of select="@sexo"/></xsl:with-param>
                        </xsl:call-template>
                        
                    </xsl:when>
                    <xsl:when test="@sexo = 'M'">
                        
                            <xsl:attribute name="style">background-color: rgb(188,225,247);</xsl:attribute>
                            <xsl:value-of select="."/>
                        
                        <xsl:call-template name="imagen">
                            <xsl:with-param name="sexo"><xsl:value-of select="@sexo"/></xsl:with-param>
                        </xsl:call-template>
                        
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
        </xsl:for-each>
        </td>

    </xsl:template>
    
    <xsl:template name="imagen">
        <xsl:param name="sexo"/>
        <img src="{/primerDia1DAW/alumnado/imagen[@sexo=$sexo]}"/>
    </xsl:template>
    
</xsl:stylesheet>