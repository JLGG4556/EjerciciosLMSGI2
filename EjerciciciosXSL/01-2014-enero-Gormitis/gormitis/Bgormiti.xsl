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
            </head>
            <body>
                <table border="1" width="60%">
                    
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
                
                <!-- llamar a bucleforColumna -->
                
            </tr>
            
        </xsl:if>
        
    </xsl:template>
    
    <xsl:template name="bubleForColumna" >
        <xsl:param name="i"/>
        <xsl:param name="j"/>
        
        <!-- Si la j es menor que 2 -->
        <xsl:if test="$j &lt;= 2">
            
            <xsl:call-template name="celda">
                
               <!-- llamar al template celda -->
                
            </xsl:call-template>
            
        </xsl:if>
        
    </xsl:template>
    
    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        
        <td>
            <xsl:for-each select="gormitiEnMapa">
                <!-- Compruebo si mis cordenas coinciden con las de un gormiti -->
                <xsl:if test="@x = $x and @y = $y ">
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
        
        <xsl:param name="tribu">
            
            <xsl:for-each select="/gormitis/gormiti">
                <xsl:if test="$tribu = @tribu">
                    
                </xsl:if>
            </xsl:for-each>
            
        </xsl:param>
        
    </xsl:template>

    
</xsl:stylesheet>