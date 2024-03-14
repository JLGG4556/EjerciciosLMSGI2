<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="gormitis" >
        
        <!-- <xsl:apply-templates/> -->
        <html>
            <head>
                <title>Gormitis</title>
                <style type="text/css">
                    img {
                    width: 100px;
                    }
                    td {
                    width: 400px;
                    height: 250px;
                    }
                </style>
            </head>
            <body>
                <table border="1" 
                    style="background: url('{/gormitis/tablero/@url}') no-repeat;">                
                    <!-- llamo al template bucleforfila -->
                    <xsl:call-template name="bucleforfila">
                        <!-- variable i que comienza en 0  para poder acerlo en templade debe tener una variable i-->
                        <xsl:with-param name="i">0</xsl:with-param>
                    </xsl:call-template>
                        
                </table>
            </body>
            
        </html>
    </xsl:template>
    
    <xsl:template name="bucleforfila">
        <!-- Variable i -->
        <xsl:param name="i"/>
        
        <!-- si la i es menor que 2 -->
        <!-- &lt;= menor que -->
        <xsl:if test="$i &lt;= 2">

            <tr>

                <xsl:call-template name="bubleForColumna">
                    <xsl:with-param name="i">
                        <xsl:value-of select="$i"/>
                    </xsl:with-param>
                    <xsl:with-param name="j">0</xsl:with-param>
                </xsl:call-template>

            </tr>

            <xsl:call-template name="bucleforfila">
                <!-- El template se llama a si mismo para generar un bucle -->
                <xsl:with-param name="i">
                    <xsl:value-of select="$i + 1"/>
                </xsl:with-param>
            </xsl:call-template>

        </xsl:if>
        
    </xsl:template>
    
    <xsl:template name="bubleForColumna" >
        <xsl:param name="i"/>
        <xsl:param name="j"/>
        
        <!-- Si la j es menor que 2 -->
        <xsl:if test="$j &lt;= 2">
            <xsl:call-template name="celda">
                
                <!-- la x tendra el valor de la variable j
                     y la y tendra el valor de la variable i-->
               <xsl:with-param name="x"><xsl:value-of select="$j"/></xsl:with-param>
                <xsl:with-param name="y"><xsl:value-of select="$i"/></xsl:with-param>
                
            </xsl:call-template>
            <!-- El template se llama a si mismo para generar un bucle -->
            <xsl:call-template name="bubleForColumna">
                <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>        
            </xsl:call-template>
            
        </xsl:if>
        
    </xsl:template>
    
    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>

        <td>
            <xsl:for-each select="/gormitis/tablero/gormitiEnMapa">
                <!-- Compruebo si mis cordenas coinciden con las de un gormiti -->
                <xsl:if test="@x = $x and @y = $y">
                    <!-- llamo al template imagenEncelda -->
                    <xsl:call-template name="imagenEnCelda">

                        <!-- Creo una variable tribu con el valor del atributo tribu -->
                        <xsl:with-param name="tribu">
                            <xsl:value-of select="@tribu"/>
                        </xsl:with-param>

                    </xsl:call-template>

                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    
    <xsl:template name="imagenEnCelda">

        <xsl:param name="tribu"/>
        <xsl:for-each select="/gormitis/gormiti">
            <!-- si el texto de el atributo tribu coincide con mi variable 
                tribu entonces coloco una umg con los datos dentro del elemento gormiti -->
            <xsl:if test="$tribu = @tribu">
                <img src="{.}"/>
            </xsl:if>
        </xsl:for-each>

    </xsl:template>
    
</xsl:stylesheet>