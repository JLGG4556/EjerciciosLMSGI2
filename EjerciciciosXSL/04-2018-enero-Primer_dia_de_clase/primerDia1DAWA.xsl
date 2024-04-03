<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

    <xsl:template match="primerDia1DAW">
        <html>
            <head>
                <title>PrimerDia1DAW</title>
                <!-- Estilo para el fichero html -->
                <style type="text/css">
                    table, th, td {
                    border: 1px solid black;
                    border-collapse: collapse;
                    }
                </style>
            </head>
            <!-- /////////////////////BODY/////////////////// -->
            <body>
                <table>
                    <!-- **********Uso apply templates **************-->
                    <xsl:apply-templates select="horario/dia"/>
                </table>
            </body>
            <!-- /////////////////////BODY/////////////////// -->
        </html>
    </xsl:template>


    <!-- //////////////////////TEMPLATE//////////////////////////// -->
    <xsl:template match="horario/dia">
        <tr>
            <td><xsl:value-of select="@desc"/></td>
            <xsl:for-each select="hora">
                <!-- *********************Las materias son ordenadas ************************ -->
                <!-- Ordeno las materias con el atributo orden que tiene el elemento hora -->
                <xsl:sort select="@orden"/>
                <!-- ***************** Uso call template y se pansan parametos **************************** -->
                <xsl:call-template name="celdaConColor">
                    <xsl:with-param name="materia"> <!-- Parametro materia con valor del elemento hora  -->
                        <xsl:value-of select="."/>
                    </xsl:with-param>
                    <!-- ******************** Las celdas se mustran colores alternos ************************* -->
                    <xsl:with-param name="color"> <!-- Segundo parametro usando position -->
                        <xsl:choose>
                            <xsl:when test="position() mod 2 = 1">lightblue;</xsl:when>
                            <xsl:otherwise>white;</xsl:otherwise>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
        </tr>
    </xsl:template>
    
    <xsl:template name="celdaConColor">
        <xsl:param name="color"/>
        <xsl:param name="materia"/>
        <td style="background:{$color};">
            <xsl:value-of select="$materia"/>
        </td>
    </xsl:template>
    
</xsl:stylesheet>
