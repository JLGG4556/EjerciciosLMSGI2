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
                <xsl:call-template name="tablaHorario"/>
            </body>
            <!-- /////////////////////BODY/////////////////// -->
        </html>
    </xsl:template>


    <!-- //////////////////////TEMPLATE//////////////////////////// -->
    <xsl:template name="tablaHorario">
        <table>
            <xsl:for-each select="horario/dia">
                <tr>
                    <th>
                        <xsl:value-of select="@desc" />
                    </th>
                    <!-- seleciono un template que haga math con hora -->
                    <xsl:apply-templates select="hora"/>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
    
    <xsl:template match="hora">
            <td>
                <!-- Creo la variable materia con el valor que hay dentro del elemnto -->
                <xsl:variable name="materia"><xsl:value-of select="."/></xsl:variable>
                <!-- Elijo un color segun el valor de la materia -->
                <xsl:choose>
                    <xsl:when test="$materia = 'PROG'">
                        <xsl:attribute name="style">background-color: aqua;</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$materia = 'BBDD'">
                        <xsl:attribute name="style">background-color: purple;</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$materia = 'FOL'">
                        <xsl:attribute name="style">background-color: green;</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$materia = 'LMSGI'">
                        <xsl:attribute name="style">background-color: blue;</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$materia = 'ENT DES'">
                        <xsl:attribute name="style">background-color: yellow;</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$materia = 'SIST INF'">
                        <xsl:attribute name="style">background-color: lightblue;</xsl:attribute>
                    </xsl:when>
                </xsl:choose>
                <xsl:value-of select="." >
                    
                </xsl:value-of>
            </td>
    </xsl:template>

</xsl:stylesheet>