<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="periodico">
        <html>
            <head>
                <title><xsl:value-of select="@nombre"/></title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <div>
                    <xsl:attribute name="style">width: 1000px; margin: 0 auto;</xsl:attribute>
                    
                    <div>
                        <xsl:attribute name="style">width: 1000px;</xsl:attribute>
                        
                        <!-- Paso de parametros -->
                        <xsl:call-template name="banner"> <!-- ///BANNER/// -->
                            <xsl:with-param name="ancho">997</xsl:with-param>
                            <xsl:with-param name="alto">115</xsl:with-param>
                        </xsl:call-template> <!-- ///BANNER/// -->
                    </div>
                    
                    <xsl:apply-templates select="menu"/> <!-- ///MENU/// -->
                    <div>
                        <xsl:attribute name="style">width: 700px; float: left;</xsl:attribute>
                        <xsl:apply-templates select="noticias"/> <!-- ///NOTICIAS/// -->
                    </div>
                    
                    <div>
                        <xsl:attribute name="style">width: 295px; float: right;</xsl:attribute>
                        <xsl:apply-templates select="publicidad"/> <!-- ///ADDS/// -->
                    </div>
                    
                </div>
            </body>
        </html>
        
    </xsl:template>
    
    <!-- /////////////////////////////BANNER///////////////////////////// -->
    <xsl:template name="banner">
        <xsl:param name="alto"/>
        <xsl:param name="ancho"/>
        <img>
            <xsl:attribute name="src"><xsl:value-of select="@logo"/></xsl:attribute>
            <xsl:attribute name="width"><xsl:value-of select="$ancho"/></xsl:attribute>
            <xsl:attribute name="height"><xsl:value-of select="$alto"/></xsl:attribute>
        </img>
    </xsl:template>
    <!-- /////////////////////////////BANNER///////////////////////////// -->
    
    <!-- /////////////////////////////MENU////////////////////////////////// -->
    <xsl:template match="menu">
        <div>
            <xsl:attribute name="style">width: 1000px; margin: 0px; padding: 0px;</xsl:attribute>
            <xsl:attribute name="id">menu</xsl:attribute>
            <ul>
                <xsl:for-each select="enlace">
                    <li>
                        <xsl:choose>
                            <xsl:when test="position() mod 2 = 0">
                                <xsl:attribute name="style">background:#DDE640;</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="style">background:orange;</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                        <a>
                            <xsl:attribute name="href">#</xsl:attribute>
                            <xsl:value-of select="."/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
    <!-- /////////////////////////////MENU////////////////////////////////// -->
    
    <!-- /////////////////////////////NOTICIAS////////////////////////////////// -->
    <xsl:template match="noticias">
        <xsl:for-each select="noticia">
            <div>
                <xsl:choose>
                    <xsl:when test="@dobleAncho = 's'">
                        <xsl:attribute name="class">noticiaDobleAncho</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="class">noticia</xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                
                <h2><xsl:value-of select="titular"/></h2>
                <h4><xsl:value-of select="subtitular"/></h4>
                <img>
                    <xsl:attribute name="src"><xsl:value-of select="@imagen"/></xsl:attribute>
                </img>
                <span>
                    <xsl:attribute name="class">fechaNoticia</xsl:attribute>
                    <xsl:value-of select="@fecha"/>
                </span>
                <span>
                    <xsl:attribute name="class">comentariosNoticia</xsl:attribute>
                    <xsl:value-of select="@comentarios"/> comentarios
                </span>
            </div>
        </xsl:for-each>
    </xsl:template>
    <!-- /////////////////////////////NOTICIAS////////////////////////////////// -->
    
    <!-- /////////////////////////////ADDS///////////////////////////////////// -->
    <xsl:template match="publicidad">
        <xsl:for-each select="anuncio">
            <xsl:sort select="@orden"/>
            <div>
                <xsl:attribute name="class">divPublicidad</xsl:attribute>
                <img>
                    <xsl:attribute name="src"><xsl:value-of select="@imagen"/></xsl:attribute>
                </img>
            </div>
            
        </xsl:for-each>
    </xsl:template>
    <!-- /////////////////////////////ADDS///////////////////////////////////// -->
    
    <!-- /////////////////////////////STYLE////////////////////////////////// -->
    <xsl:template name="css">
        <style>
            body {
            font-family: Arial;
            font-size: 12px;
            }
            
            ol, ul
            {
            margin-top: 10px;
            margin-left: 0px;
            }
            
            #menu li
            {
            margin-left: 0px;
            display: inline;
            list-style-type: none;
            padding: 10px 50px;
            }
            
            .noticia {
            /* border: #000 solid 1px; */
            padding: 10px 5px;
            float: left; 
            width: 338px;
            }
            
            .noticia img {
            width: 338px;
            }
            
            .noticiaDobleAncho {
            /* border: #000 solid 1px; */
            padding: 10px 5px;
            float: left; 
            width: 690px;
            }
            
            .noticiaDobleAncho img {
            width: 690px;
            }
            
            .fechaNoticia {
            color: #A3A34B;
            }
            
            .comentariosNoticia {
            color: #A3A34B;
            padding-left: 20px;
            }
            
            .divPublicidad {
            /* border: #000 solid 1px; */
            padding: 10px 5px;
            float: right; 
            width: 280px;                    
            }
            
            .divPublicidad img {
            width: 200px;
            }
        </style> 
    </xsl:template>
    <!-- /////////////////////////////STYLE////////////////////////////////// -->
    
</xsl:stylesheet>