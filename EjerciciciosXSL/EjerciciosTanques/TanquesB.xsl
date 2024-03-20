<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/juegoTanques">
        <html>
            <head>
                <title>Jugadas tanques</title>
                <style type="text/css">
                    td, th {
                    width: 30px;
                    height: 30px;
                    }
                    th {
                    background: blue;
                    color: white;
                    }
                </style>
            </head>
            <!-- /////////////////////BODY////////////////////// -->
            <body>
                <!-- recorro cada elementod jugada grafica -->
                <xsl:for-each select="jugadasGraficas/jugadaGrafica">
                    <table border="1" with="90%" align="center">
                        <tr>
                            <th></th>
                            <th>1</th>
                            <th>2</th>
                            <th>3</th>
                            <th>4</th>
                            <th>5</th>
                            <th>6</th>
                            <th>7</th>
                            <th>8</th>
                        </tr>
                        <!-- Llamo al template bucle for fila y declaro una variable i que empieza en i -->
                        <xsl:call-template name="bucleForFila">
                            <xsl:with-param name="i">1</xsl:with-param>
                        </xsl:call-template>
                    </table>
                    <p/>
                </xsl:for-each>
            </body>
            <!-- /////////////////////BODY////////////////////// -->
        </html>
    </xsl:template>
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <!-- la i es menor que 8 -->
        <xsl:if test="$i &lt;= 8">
            <tr>
                <th><xsl:value-of select="$i"/></th>
                <!-- Llamo a un template bucleForCOlumna y declaro la j -->
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                    <xsl:with-param name="j">1</xsl:with-param>
                </xsl:call-template>
            </tr>
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/> 
        <xsl:if test="$j &lt;= 8">
            <xsl:call-template name="celda">
                <xsl:with-param name="x"><xsl:value-of select="$j"/></xsl:with-param>
                <xsl:with-param name="y"><xsl:value-of select="$i"/></xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="bucleForColumna">
                <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td>
            <xsl:for-each select="posicion">
                <xsl:if test="@x = $x and @y = $y">
                    <xsl:choose>
                        <xsl:when test="@tipo = 'tanque'">
                            <xsl:attribute name="style">background: red;</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="@tipo = 'pared'">
                            <xsl:attribute name="style">background: black;</xsl:attribute>
                        </xsl:when>  	        
                    </xsl:choose>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    
</xsl:stylesheet>