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
                    table {
                    border: 1px solid black;
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
                    <xsl:apply-templates/>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
    
    <xsl:template match="primerDia1DAWA/horario/dia">
        <xsl:for-each select="hora">
            <td>
                <xsl:value-of select="." />
            </td>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>