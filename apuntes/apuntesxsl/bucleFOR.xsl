<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="elemento">
        <table border="1" with="90%">
            
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i">1</xsl:with-param> <!-- Valor inicial para la i -->
            </xsl:call-template>
            
        </table>
    </xsl:template>
    
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
                    <xsl:value-of select="@nombre"/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    
</xsl:stylesheet>