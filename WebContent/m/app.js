/*global Ext:false */
Ext.application({
    name: 'Sencha',

    launch: function () {
        //The whole app UI lives in this tab panel
        Ext.Viewport.add({
            xtype: 'tabpanel',
            fullscreen: true,
            tabBarPosition: 'bottom',

            items: [
            // This is the home page, just some simple html
            {
                title: 'Home',
                iconCls: 'home',
                cls: 'home',
                html: ['<img height="471" src="/bassSearchMobile.jpg" />', ' ', " ", ' '].join("")
            },

            // This is the recent blogs page. It uses a tree store to load its data from blog.json
            {
                xtype: 'nestedlist',
                title: 'List',
                iconCls: 'user',
                cls: 'blog',
                displayField: 'title',

                store: {
                    type: 'tree',

                    fields: ['title', 'link', 'author', 'contentSnippet', 'content',
                    {
                        name: 'leaf',
                        defaultValue: true
                    }],

                    root: {
                        leaf: false
                    },

                    proxy: {
                        type: 'jsonp',
                        url: 'https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&amp;q=http://feeds.feedburner.com/SenchaBlog',
                        reader: {
                            type: 'json',
                            rootProperty: 'responseData.feed.entries'
                        }
                    }
                },

                detailCard: {
                    xtype: 'panel',
                    scrollable: true,
                    styleHtmlContent: true
                },

                listeners: {
                    itemtap: function (nestedList, list, index, element, post) {
                        this.getDetailCard().setHtml(post.get('content'));
                    }
                }
            },

            // This is the contact page, which features a form and a button. The button submits the form
            {
                xtype: 'formpanel',
                title: 'Enter!',
                iconCls: 'star',
                url: 'contact.php',
                layout: 'vbox',

                items: [{
                    xtype: 'fieldset',
                    title: 'Enter to win!',
                    instructions: 'Give us all you got!!!',

                    items: [{
                        xtype: 'textfield',
                        label: 'First Name',
                        name: 'firstname'
                    }, {
                        xtype: 'textfield',
                        label: 'Last Name',
                        name: 'lastname'
                    }, {
                        xtype: 'emailfield',
                        label: 'Email',
                        name: 'emailaddress'
                    }, {
                        xtype: 'textfield',
                        label: 'Twitter ID',
                        name: 'twitterid'
                    }, {
                        xtype: 'checkboxfield',
                        label: 'Send Docs',
                        name: 'contactMe'
                    }, {
                        xtype: 'textfield',
                        label: 'Stage Name',
                        name: 'sname'
                    }, {
                        xtype: 'textfield',
                        label: 'Catch Phrase',
                        name: 'cphrase'
                    }, {
                        xtype: 'textareafield',
                        label: 'Mini Bio',
                        name: 'minibio',
                        height: 90
                    }]
                }, {
                    xtype: 'button',
                    text: 'Send',
                    ui: 'confirm',

                    // The handler is called when the button is tapped
                    handler: function () {

                        // This looks up the items stack above, getting a reference to the first form it see
                        var form = this.up('formpanel');

 
                        // Sends an AJAX request with the form data to the url specified above (contact.php).
                        // The success callback is called if we get a non-error response from the server
                       form.submit({
                            url: 'http://localhost:8080/mobilefeed',
                            params: Ext.urlEncode(form.getValues()),
                            method:'POST', 
                            enctype:'multipart/form-data', 
                            headers: {'Content-type':'multipart/form-data'},
                            success : function(response) {
                                var text = response.responseText;
                                Ext.Msg.alert('Thanks for entering', text, Ext.emptyFn);
                            },
                            failure : function(response) {
                                var text = response.responseText;
                                Ext.Msg.alert('All required except TwitterID', text, Ext.emptyFn);
                            }                                                            
                        });
                    }
                }]
            }]
        });
    }
});
