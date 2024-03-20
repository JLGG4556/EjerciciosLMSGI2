<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    

    <xsl:template match="/juegoTanques">
        <html>
            <head>
                <title>juegoTanques</title>
                <style type="text/css">
                    th {
                    background: blue;
                    color: white;
                    }
                    img {
                    width: 50px;
                    }
                </style>
            </head>
            
            <!-- /////////////////////BODY////////////////////// -->
            <body>
                <table border="1" width="80%" align="center">
                    <tr>
                        <!-- Titulo -->
                        <th>Jugada</th>
                        <th colspan="2">Tanque</th>
                        <th>Descripcion</th>
                    </tr>
                    <!-- Recorro cada elemento que hat dentro de juegadas descritas -->
                    <xsl:for-each select="jugadasDescritas/jugada">
                        <tr>
                            <!-- Compruebo la posicion para colorear el fondo -->
                            <xsl:if test="position() mod 2 = 1">
                                <xsl:attribute name="style">
                                    background: lightblue;
                                </xsl:attribute>
                            </xsl:if>
                            <td><xsl:value-of select="position()"/></td>
                            <td><xsl:value-of select="@jugador"/></td>
                            <td>
                                <!-- Llamo al templante imagen tanque y 
                                creo una variable jugador con el valor de jugaror
                                el foco ahora mismo se qnquerta en jugada por lo que
                                la variable tomara el valor de ese atributo -->
                                <xsl:call-template name="imagenTanque">
                                    <xsl:with-param name="jugador"><xsl:value-of select="@jugador"/></xsl:with-param> 
                                </xsl:call-template>
                                <!-- NOTA es importante dejar encerrada completamente la variable podrian entra caracteres especiales -->
                            </td>
                            <td><xsl:value-of select="@desc"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
            <!-- /////////////////////BODY////////////////////// -->
        </html>
    </xsl:template>
    
    <!-- /////////////////////////REGLAS////////////////////////// -->
    
    <xsl:template name="imagenTanque">
        <xsl:param name="jugador"/>
        <!-- Tengo un array de imagenTanque y voy a selecionar el valor de
            imagen tanque cuando la variable jugador se igual al atributo jugador -->
        <img src="{/juegoTanques/tanques/imagenTanque[@jugador=$jugador]}"/>
    </xsl:template>
    
</xsl:stylesheet>