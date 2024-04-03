<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="periodico">
        <html>
            <head>
                <title>El mundo yesterday</title>
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
            </head>
            <body>
                <xsl:apply-templates select="menu"/>
            </body>
        </html>
        
    </xsl:template>
    
    <xsl:template match="menu">
        <div>
            <xsl:attribute name="style">width: 1000px; margin: 0px; padding: 0px;</xsl:attribute>
            <xsl:attribute name="id">menu</xsl:attribute>
            <ul>
                <xsl:for-each select="enlace">
                    <li>
                        <xsl:call-template name="color">
                            <xsl:with-param name="post"><xsl:value-of select="position()"/></xsl:with-param>
                        </xsl:call-template>
                        
                        <a href="#"><xsl:value-of select="."/></a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
    
    <xsl:template name="color">
        <xsl:param name="post"></xsl:param>
        <xsl:choose>
            <xsl:when test="$post mod 2 = 0">
                <xsl:attribute name="style">background:#DDE640;</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="style">background:orange;</xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>      
    </xsl:template>
    
</xsl:stylesheet>