/// <reference types="cypress" />

describe('Jungle App', () => {

  it('Navigate to home page and click product',()=>{
    cy.visit("/");
    cy.get(".products.article").should('exist');
    cy.get(".products.article a").first().click();
  });
  
})
