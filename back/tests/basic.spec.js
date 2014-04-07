describe('homepage', function() {
    var driver;

    beforeEach(function() {
        browser.get('http://maciejmazur.com/');
        pro = protractor.getInstance();
    });

    it('should have a container', function() {
        var containers = element(by.css('.container'));
        var isAnyContainerPresent = containers.isPresent();

        expect(isAnyContainerPresent).toBe(true);
    });
});