<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

    <!--Busco si hay algun elemento raiz que se llame gormitis-->
    <xsl:template match="/gormitis">
        <!--Suponiendo que encontrao ese elemento entro en el-->
        <html>
            <body>
                <table  width="50%" align="center">
                    <tr>
                        <th></th>
                        <th>Gormiti</th>
                        <th>Tribu</th>
                    </tr>
                    <!-- LLamo al template filasTabla para aplicarlo -->
                    <xsl:call-template name="filasTabla"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <!-- ////////////////////////////////Reglas////////////////////////////// -->
    <xsl:template name="filasTabla">
        <!-- Itero todos lo elementos gormiti -->
        <xsl:for-each select="gormiti">
            <tr>
                
                <!-- Con esta linea pruebo el resto de la posicion y si el resto es cero lo pinto de azul -->
                <xsl:if test="position() mod 2 = 1">
                    <xsl:attribute name="style">background: #87adfa;</xsl:attribute>
                </xsl:if>
                
                <td>
                    <!-- Con esta linea muestro un numero que es la posicion de la tabla -->
                    <xsl:value-of select="position()"/>
                    
                </td>
                <td>
                    <!-- Para colocar una imagen lo que hago es poner un 
                                    atribito src y a continuacion sacar los valores del elemnto en el que estoy -->
                    <img>
                        <xsl:attribute name="src">
                            <xsl:value-of select="."/>
                        </xsl:attribute>
                    </img>
                </td>
                <td>
                    <!-- En esta linea saco un valor de el atributo tribu del elemento gormiti -->
                    <xsl:value-of select="@tribu"/>
                </td>
            </tr>
        </xsl:for-each>
    </xsl:template>
    <!-- //////////////////////////////////////////////////////////////////// -->
    
</xsl:stylesheet>