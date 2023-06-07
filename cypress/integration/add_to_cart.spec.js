describe('Jungle App', () => {

  it('Navigate to home page add product to cart',()=>{
    cy.viewport(1280, 720) 
    cy.visit("/");

    cy.contains('My Cart (').invoke('text').then((cartText) => {
      const initialCount = parseInt(cartText.match(/\d+/)[0]); // Extracts the number from the text
      cy.get(".products.article .btn").first().click(); // Click the 'Add to Cart' button of the first product
      cy.contains('My Cart (').invoke('text').should((newCartText) => {
        const newCount = parseInt(newCartText.match(/\d+/)[0]); // Extracts the number from the text
        expect(newCount).to.eq(initialCount + 1);
      });
    });
  });
  
});
