<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

    <!--Busco si hay algun elemento raiz que se llame gormitis-->
    <xsl:template match="/gormitis">
        <!--Suponiendo que encontrao ese elemento entro en el-->
        <html>
            <head>
                <title>Gormitis</title>
            </head>
            <body>
                <table>
                    <xsl:for-each select="gormiti">
                        <tr>
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
                </table>
            </body>
        </html>
    </xsl:template>

    <!-- Reglas -->
    <xsl:template match="gormiti">
        
    </xsl:template>
    

</xsl:stylesheet>